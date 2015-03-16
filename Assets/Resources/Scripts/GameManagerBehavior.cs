using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;

public class GameManagerBehavior : MonoBehaviour {

	private static int commitNum;
	private	const int MAX_FILES = 100;
	public List<GameObject> MyKids; 
	public GameObject NodeDirPrefab; 
	public GameObject NodeLeafPrefab; 
	public GameObject ThreeDTextPrefab;
	public Transform CameraTransform;
	private TextAsset json;

	// The pseudo-root never changes.
	private static NodeBehavior parentBehavior;
	private static GameObject ROOT; 
	private	static GameObject parent;

	// Off-center of scene-center(0,0,0) and just below the terrain surface is the tree's pseudo-root. 
	// Pseudo-root position is relative to parent GameManager (pseudo-root position set in createNullRoot())
	private static  Vector3 ROOTLOCATION = new Vector3(0, -0.1f, 53); 

	// Returns a List of dictinoaries. 
	// Each dictionary is one commit. Key is a string. Value as a list of strings/filnames.
	List<
		Dictionary<
			char, List<string>>> commits;
	



	void Start (){
		json = Resources.Load ("this_web", typeof(TextAsset)) as TextAsset;
		BeginViz();
	}




	void BeginViz(){
		commits = Parser.ParseCommitLog(json.text);
		StartCoroutine(CreateTree());
	}




	GameObject CreatePseudoRoot(){
		ROOT = (GameObject)Instantiate(NodeDirPrefab, ROOTLOCATION, Quaternion.identity);
		parentBehavior = ROOT.GetComponent<NodeBehavior> ();

		// root's parent is the game manager which is at 0,0,0 the center of world
		parentBehavior.transform.SetParent(this.transform); 

		// the first 'parent' is the ROOT and program will always start traversal with new filepath at ROOT
		parent = ROOT;
		parentBehavior.myPath = "ROOT";

		return ROOT;
	}




	IEnumerator CreateTree(){
		// sets global static ROOT game object and its rootBehavior
		CreatePseudoRoot(); 
		commitNum = 0;		

		// pause to give the viewer time to settle in
		yield return new WaitForSeconds(20f);

		// Each time through the commits List gives us a dictionary that represents one commit
		foreach( Dictionary<char, List<string>> d in commits ){
			yield return StartCoroutine(ParseSingleCommit(d));
			commitNum++;
			Debug.Log ("Commit num: " + commitNum);
			yield return new WaitForSeconds(2);
		}
		StartOver();
		yield break;
	}




	void StartOver(){
		NodeUtility.RemoveNode(ROOT, this);
		BeginViz();
	}




	IEnumerator ParseSingleCommit(Dictionary<char, List<string>> d){
		int fileCount = 0;

		// for each key of the key->value pairs...
		// Gets us the key and its associated files list
		foreach(char key in d.Keys){

			// get the list of files associated with this particular key in this particular commit (e.g. the A/Additions in commit no.0)
			List<string> listToAffect = d[key];

			// for each file to do something to...
			foreach(string filePath in listToAffect){

				// to traverse - start back at the pseudo base ROOT of the tree 
				parent = ROOT;

				// check for each node of a filepath by splitting the filepath
				string[] singleFilePathArray = filePath.Split ('/');

				// Add, Delete, or Modify in bursts of 100 files for better viewing / more dynamic growth
				if(fileCount > MAX_FILES){
					yield return new WaitForSeconds(0.5f);
					fileCount = 0;
				}
				++fileCount;

				// traverse or create the filepath i.e. the path of nodes
				for(int directoryLevel = 0; directoryLevel < singleFilePathArray.Length; directoryLevel++){

					// one pathSubstring is or will be one node
					string pathSubstring = singleFilePathArray[directoryLevel];

					switch(key){
	/******* CASE A *******/
						case 'A':
							AddNode(pathSubstring,singleFilePathArray, directoryLevel);
							break;
	/******* CASE D *******/
						case 'D':
							DeleteNode(pathSubstring, singleFilePathArray.Length);
							break;
	/******* CASE M *******/
						case 'M':
							ModifyNode(pathSubstring);
							break;
						default:
							break;

					} // close switch(key)

				} // close for loop
			} // close foreach filepath in listToAffect
		} // close foreach key in d.keys
	} // close function




	/******* CASE A *******/

	void AddNode(string pathSubstring, string[] singleFilePathArray, int directoryLevel){

		// create node if it doesn't exist
		if(NodeUtility.StringExistsAsNode(pathSubstring, parent) == false){

			GameObject currentNode;
			bool isLeaf;

			if(directoryLevel == singleFilePathArray.Length - 1){
				isLeaf = true;
				currentNode = (GameObject)Instantiate(NodeLeafPrefab, new Vector3(0,0,0), Quaternion.identity);
			}
			else{
				isLeaf = false;
				currentNode = (GameObject)Instantiate(NodeDirPrefab, new Vector3(0,0,0), Quaternion.identity);
			}
			currentNode = NodeUtility.PlaceNodeInScene(currentNode, parent);
			
			// accesses parent & adds a reference of the new node as being a child of parent & returns nodeBehavior
			NodeBehavior nodeToAddBehavior = setNodeAsChildOfParent(currentNode, pathSubstring);
			
			// filepath has a leaf node at the end i.e. when we're at the end of singleFilePathArray
			nodeToAddBehavior.leaf = isLeaf;

			if(!isLeaf){
				parent = currentNode;
				parentBehavior = currentNode.GetComponent<NodeBehavior>();
			}
			SetNodeText(currentNode, pathSubstring);

		} // close if


		// else the node with substring exists and continue traversal
		else{
			parent = NodeUtility.GetNodeWithGivenPath(pathSubstring, parent); // get node GameObject
			parentBehavior = parent.GetComponent<NodeBehavior>();
		} 
	}



	
	/******* CASE D *******/

	void DeleteNode(string pathSubstring, int directoryLevel){
		GameObject nodeToDelete = NodeUtility.GetNodeWithGivenPath(pathSubstring, parent);
		NodeBehavior nodeToDeleteBehavior = nodeToDelete.GetComponent<NodeBehavior>();
		
		if(nodeToDeleteBehavior.leaf){
			// myKids is read-only so put it into a usable variable
			int parentKidsCount = parent.GetComponent<NodeBehavior>().myKids.Count;
			
			// this doesn't decrement the parentBehavior's myKids.Count so using parentKidsCount...
			NodeUtility.RemoveNode(nodeToDelete, this);
			
			// using parentKidsCount to check if a parent directory will be empty after node deletions
			parentKidsCount--;
			
			// git doesn't allow empty directories - it considers them implicitly deleted
			if(parentKidsCount < 1){
				NodeUtility.RemoveNode(parent, this);
			}
		}
		parent = nodeToDelete;	
	}




	/******* CASE M *******/

	void ModifyNode(string pathSubstring){
		GameObject nodeToModify = NodeUtility.GetNodeWithGivenPath(pathSubstring, parent);
		NodeBehavior nodeToModifyBehavior = nodeToModify.GetComponent<NodeBehavior>();

		if(nodeToModifyBehavior.leaf){
			ParticleSystem particlesystem = (ParticleSystem)nodeToModify.GetComponent("ParticleSystem");
			particlesystem.particleSystem.Play();
			particlesystem.enableEmission = true;
		}
		else{
			parent = nodeToModify;	
		}
	}




	public void SetNodeText(GameObject currentNode, string pathSubstring){
		var threeDText = Instantiate(ThreeDTextPrefab, currentNode.transform.position, Quaternion.identity) as GameObject;
		if (!threeDText) return;
		threeDText.SetActive(false);
		threeDText.transform.SetParent(currentNode.transform);
		var text = threeDText.GetComponent<GameBillboardText>();
		if (!text) return;
		text.Target = CameraTransform.transform;
		text.SetText(pathSubstring);
		threeDText.SetActive(true);
	}



	
	NodeBehavior setNodeAsChildOfParent(GameObject currentNode, string pathSubstring){
		parentBehavior = parent.GetComponent<NodeBehavior> ();
		NodeBehavior nodeBehavior = currentNode.GetComponent<NodeBehavior> ();
		nodeBehavior.transform.localPosition = Vector3.zero;
		nodeBehavior.parent = parent;
		nodeBehavior.myPath = pathSubstring;
		return nodeBehavior;
	}
	
} // close class




