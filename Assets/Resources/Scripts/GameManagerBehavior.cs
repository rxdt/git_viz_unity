using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;

public class GameManagerBehavior : MonoBehaviour {

	private static int commitNum;
	public List<GameObject> MyKids; 
	public GameObject NodeDirPrefab; 
	public GameObject NodeLeafPrefab; 

	// The pseudo-root never changes.
	private static NodeBehavior parentBehavior;
	private static GameObject ROOT; 
	private	GameObject parent;

	// Off-center of scene-center(0,0,0) and just below the terrain surface is the tree's pseudo-root. 
	// Pseudo-root position is relative to parent GameManager (pseudo-root position set in createNullRoot())
	private static  Vector3 ROOTLOCATION = new Vector3(0, -0.1f, 53); 

	// Returns a List of dictinoaries. 
	// Each dictionary is one commit. Key is a string. Value as a list of strings/filnames.
	List<
		Dictionary<
			char, List<string>>> commits;
	



	void Start () {
		TextAsset json = Resources.Load ("rails", typeof(TextAsset)) as TextAsset;
		commits = Parser.parseCommitLog(json.text);
		StartCoroutine(createTree());
	}




	GameObject createNullRoot(){
		ROOT = (GameObject)Instantiate(NodeDirPrefab, ROOTLOCATION, Quaternion.identity);
		parentBehavior = ROOT.GetComponent<NodeBehavior> ();

		// root's parent is the game manager which is at 0,0,0 the center of world
		parentBehavior.transform.SetParent(this.transform); 

		// the first 'parent' is the ROOT and program will always start traversal with new filepath at ROOT
		parent = ROOT;
		parentBehavior.myPath = "ROOT";

		return ROOT;
	}




	IEnumerator createTree(){
		// sets global static ROOT game object and rootBehavior
		createNullRoot(); 
		commitNum = 0;		

		yield return new WaitForSeconds(10f);

		// Each time through the commits List gives us a dictionary that represents one commit
		foreach( Dictionary<char, List<string>> d in commits ){
			yield return StartCoroutine(parseSingleCommit(d));
			commitNum++;
			yield return new WaitForSeconds(2);
		}
		yield break;
	}




	// Gets us the key and its associated files list
	IEnumerator parseSingleCommit(Dictionary<char, List<string>> d){
		const int MAX_FILES = 100;
		int fileCount = 0;

		// for each key of the key->value pairs...
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
		if(NodeUtility.stringExistsAsNode(pathSubstring, parent) == false){

			GameObject nodeAdd, currentNode;
			bool isLeaf;
			if(directoryLevel == singleFilePathArray.Length - 1){
				isLeaf = true;
				currentNode = (GameObject)Instantiate(NodeLeafPrefab, new Vector3(0,0,0), Quaternion.identity);
			}
			else{
				isLeaf = false;
				currentNode = (GameObject)Instantiate(NodeDirPrefab, new Vector3(0,0,0), Quaternion.identity);
			}
			currentNode.SetActive(false);
			currentNode = NodeUtility.PlaceNodeInScene(currentNode, parent);
			
			// accesses parent and adds a reference of the new node as being a child of parent
			parentBehavior = parent.GetComponent<NodeBehavior> ();
			NodeBehavior nodeAddBehavior = currentNode.GetComponent<NodeBehavior> ();
			nodeAddBehavior.transform.localPosition = Vector3.zero;
			nodeAddBehavior.parent = parent;
			nodeAddBehavior.myPath = singleFilePathArray[directoryLevel];
			
			// finishing up one file's entire path
			if(isLeaf){
				// filepath has a leaf node at the end i.e. when we're at the end of singleFilePathArray
				nodeAddBehavior.leaf = isLeaf;
			}
			else{
				parent = currentNode;
				parentBehavior = currentNode.GetComponent<NodeBehavior>();
			}
			
		} // close if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false)
		
		else{
			parent = NodeUtility.getNodeWithGivenPath(pathSubstring, parent); // get node GameObject
			parentBehavior = parent.GetComponent<NodeBehavior>();
		} // close else
	}



	
	/******* CASE D *******/

	void DeleteNode(string pathSubstring, int directoryLevel){
		GameObject nodeToDelete = NodeUtility.getNodeWithGivenPath(pathSubstring, parent);
		NodeBehavior nodeToDeleteBehavior = nodeToDelete.GetComponent<NodeBehavior>();
		
		if(nodeToDeleteBehavior.leaf){
			// myKids is read-only so put it into a usable variable
			int parentKidsCount = parent.GetComponent<NodeBehavior>().myKids.Count;
			
			// this doesn't decrement the parentBehavior's myKids.Count so using parentKidsCount...
			NodeUtility.removeNode(nodeToDelete, this);
			
			// using parentKidsCount to check if a parent directory will be empty after node deletions
			parentKidsCount--;
			
			// git doesn't allow empty directories - it considers them implicitly deleted
			if(parentKidsCount < 1){
				NodeUtility.removeNode(parent, this);
			}
		}
		parent = nodeToDelete;	
	}




	/******* CASE M *******/

	void ModifyNode(string pathSubstring){
		GameObject nodeToModify = NodeUtility.getNodeWithGivenPath(pathSubstring, parent);
		NodeBehavior nodeToModifyBehavior = nodeToModify.GetComponent<NodeBehavior>();
		
		if(nodeToModifyBehavior.leaf){
			// TODO some visual effect goes here:
			NodeUtility.showModificationEffect(nodeToModify, pathSubstring);
			Debug.Log (nodeToModifyBehavior.myPath + "it's a leaf and this is the node to modify!");
		}
		else{
			parent = nodeToModify;	
		}
	}

} // close class




