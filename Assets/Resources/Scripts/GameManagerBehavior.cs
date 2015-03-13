using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;

public class GameManagerBehavior : MonoBehaviour {

	private static 	int			    	commitNum;
	public 		   	List<GameObject> 	MyKids; 
	public 		   	GameObject	    	NodePrefab; 

	// The pseudo-root never changes.
	private static 	NodeBehavior 		parentBehavior;
	private static 	GameObject 			ROOT; 
	private			GameObject			parent;

	// Off-center of scene-center(0,0,0) and just below the terrain surface is the tree's pseudo-root. 
	// Pseudo-root position is relative to parent GameManager (pseudo-root position set in createNullRoot())
	private static  Vector3 			ROOTLOCATION = new Vector3(0, -0.1f, 53); 

	// Returns a List of dictinoaries. 
	// Each dictionary is one commit. Key is a string. Value as a list of strings/filnames.
	List<
		Dictionary<
			char, List<string>>> 		commits = Parser.parseCommitLog("");
	



	void Start () {
		StartCoroutine(createTree());
	}




	GameObject createNullRoot(){
		ROOT = (GameObject)Instantiate(NodePrefab, ROOTLOCATION, Quaternion.identity);
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

		// Each time3/11 Wednesday through the commits List gives us a dictionary that represents one commit
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
		Debug.Log("parsing a single commit and the COMMIT NUM:  " + commitNum);
		// for each key of the key->value pairs
		foreach(char key in d.Keys){

			// get the list of files associated with this particular key in this particular commit (e.g. the A/Additions in commit no.0)
			List<string> listToAffect = d[key];
			foreach(string filePath in listToAffect){
				parent = ROOT;
				string[] singleFilePathArray = filePath.Split ('/');
				if(fileCount > MAX_FILES){
					yield return new WaitForSeconds(0.5f);
					fileCount =0;
				}
				++fileCount;
				for(int directoryLevel = 0; directoryLevel < singleFilePathArray.Length; directoryLevel++){
					string pathSubstring = singleFilePathArray[directoryLevel];
					Debug.Log(pathSubstring);


					switch(key){

	/******* CASE A *******/
						case 'A':
							if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false){
								GameObject nodeAdd;
								GameObject currentNode = (GameObject)Instantiate(NodePrefab, new Vector3(0,0,0), Quaternion.identity);
								currentNode.SetActive(false);
								nodeAdd = NodeMovement.PlaceNodeInScene(currentNode, parent);
								
								// accesses parent and adds a reference of the new node as being a child of parent
								parentBehavior = parent.GetComponent<NodeBehavior> ();
								NodeBehavior nodeAddBehavior = nodeAdd.GetComponent<NodeBehavior> ();
								nodeAddBehavior.transform.localPosition = Vector3.zero;
								nodeAddBehavior.parent = parent;
								nodeAddBehavior.myPath = singleFilePathArray[directoryLevel];

								// finishing up one file's entire path
								if(directoryLevel == singleFilePathArray.Length - 1){
									// filepath has a leaf node at the end i.e. when we're at the end of singleFilePathArray
									nodeAddBehavior.leaf = true;
								}
								else{
									parent = nodeAdd;
									parentBehavior = nodeAdd.GetComponent<NodeBehavior>();
								}

							} // close if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false)


							else{
								parent = NodeMovement.getNodeWithGivenPath(pathSubstring, parent); // get node GameObject
								parentBehavior = parent.GetComponent<NodeBehavior>();
							} // close else
							break;

	/******* CASE D *******/
						case 'D':

						Debug.Log(commitNum);
						if(parent==null) Debug.Log ("yes");

							GameObject nodeToDelete = NodeMovement.getNodeWithGivenPath(pathSubstring, parent);
							NodeBehavior nodeToDeleteBehavior = nodeToDelete.GetComponent<NodeBehavior>();
						
							if(nodeToDeleteBehavior.leaf){
								// myKids is read-only so put it into a usable variable
								int parentKidsCount = parent.GetComponent<NodeBehavior>().myKids.Count;

								// this doesn't decrement the parentBehavior's myKids.Count so using parentKidsCount...
								NodeMovement.removeNode(nodeToDelete, this);

								directoryLevel = singleFilePathArray.Length;

								// using parentKidsCount to check if a parent directory will be empty after node deletions
								parentKidsCount--;
								
								// git doesn't allow empty directories - it considers them implicitly deleted
								if(parentKidsCount < 1){
									NodeMovement.removeNode(parent, this);
								}
							}
							parent = nodeToDelete;	
							break;

	/******* CASE M *******/
						case 'M':
							GameObject nodeToModify = NodeMovement.getNodeWithGivenPath(pathSubstring, parent);
							NodeBehavior nodeToModifyBehavior = nodeToModify.GetComponent<NodeBehavior>();
							
						if(nodeToModifyBehavior.leaf){
							// TODO some visual effect goes here:
								NodeMovement.showModificationEffect(nodeToModify, pathSubstring);
								Debug.Log (nodeToModifyBehavior.myPath + "it's a leaf and this is the node to modify!");
							}
							else{
								parent = nodeToModify;	
								
							}
							break;

						default:
							break;

					} // close switch(key)


				} // close for loop
			} // close foreach filepath in listToAffect
		} // close foreach key in d.keys
	} // close function


} // close class




