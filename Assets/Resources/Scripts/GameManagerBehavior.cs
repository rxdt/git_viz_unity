using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;

public class GameManagerBehavior : MonoBehaviour {

	private const  	int 			    MAX_NODE_POOL = 500;
	private static 	int			    	commitNum;
	public 		   	List<GameObject>  	MyNodePool;
	public 		   	List<GameObject> 	MyKids; 
	public 		   	GameObject	    	NodePrefab; 

	// The pseudo-root never changes.
	private static 	NodeBehavior 		parentBehavior;
	private static 	GameObject 			ROOT; 
	private			GameObject			parent;

	// Off-center of scene-center(0,0,0) and just below the terrain surface is the tree's pseudo-root. 
	// Pseudo-root position is relative to parent GameManager (pseudo-root position set in createNullRoot())
	private static  Vector3 			ROOTLOCATION = new Vector3(0, -2, 53); 

	// Returns a List of dictinoaries. 
	// Each dictionary is one commit. Key is a string. Value as a list of strings/filnames.
	List<
		Dictionary<
			char, List<string>>> 		commits = Parser.parseCommitLog("");




	void Start () {
		// creates the pool of 500 node clones ready for use in the scene as needed
		for(int count = 0; count < MAX_NODE_POOL; count++)
		{
			GameObject currentNode = (GameObject)Instantiate(NodePrefab, ROOTLOCATION, Quaternion.identity);
			MyNodePool.Add(currentNode);
			currentNode.transform.SetParent(this.transform);
			currentNode.SetActive(false);
		} 
		createTree ();
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




	void createTree(){

		// sets global static ROOT game object and rootBehavior
		createNullRoot(); 
		commitNum = 0;		

		// Each time through the commits List gives us a dictionary that represents one commit
		foreach( Dictionary<char, List<string>> d in commits ){
			parseSingleCommit(d);
			commitNum++;
		}
	}




	// Gets us the key and its associated files list
	void parseSingleCommit(Dictionary<char, List<string>> d){

		// for each key of the key->value pairs
		foreach(char key in d.Keys){

			// get the list of files associated with this particular key in this particular commit (e.g. the A/Additions in commit no.0)
			List<string> listToAffect = d[key];
			foreach(string filePath in listToAffect){
				parent = ROOT;
				string[] singleFilePathArray = filePath.Split ('/');

				for(int directoryLevel = 0; directoryLevel < singleFilePathArray.Length; directoryLevel++){
					string pathSubstring = singleFilePathArray[directoryLevel];
							Vector3 start = ROOTLOCATION;
					

					switch(key){

	/******* CASE A *******/
						case 'A':
							parentBehavior = ROOT.GetComponent<NodeBehavior> ();	
							if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false){

								// create node object & get node class
								GameObject nodeAdd = NodeMovement.PlaceNodeInSceneMyNodePool(MyNodePool, parent);
								NodeBehavior nodeAddBehavior = nodeAdd.GetComponent<NodeBehavior> ();

								// accesses parent and adds a reference of the new node as being a child of parent
								parentBehavior = parent.GetComponent<NodeBehavior> ();
								parentBehavior.myKids.Add(nodeAdd.transform);
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
							GameObject nodeToDelete = NodeMovement.getNodeWithGivenPath(pathSubstring, parent);
							NodeBehavior nodeToDeleteBehavior = nodeToDelete.GetComponent<NodeBehavior>();
						
							if(nodeToDeleteBehavior.leaf){
								// myKids is read-only so put it into a usable variable
								int parentKidsCount = parent.GetComponent<NodeBehavior>().myKids.Count;

								// this doesn't decrement the parentBehavior's myKids.Count so using parentKidsCount...
								NodeMovement.PlaceNodeBackInPool(MyNodePool, nodeToDelete, this);

								directoryLevel = singleFilePathArray.Length;

								// using parentKidsCount to check if a parent directory will be empty after node deletions
								parentKidsCount--;
								
								// git doesn't allow empty directories - it considers them implicitly deleted
								if(parentKidsCount < 2){
									NodeMovement.PlaceNodeBackInPool(MyNodePool, parent, this);
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




	// Update is called once per frame
	void Update () 
	{
		Vector3 final_position = new Vector3(5, 5, 5);

		//print(Camera.main.ScreenToWorldPoint(Input.mousePosition));
		if (Input.GetKeyUp ("space"))
		{
			NodeMovement.PlaceNodeInScene(MyNodePool, final_position);
		}
		else if (Input.GetMouseButtonDown (0))
		{
			Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
			RaycastHit hit;
			if(Physics.Raycast(ray, out hit, 100.0f) && hit.transform.tag == "Nodes")
			{
				print("Hit a node!");
				NodeMovement.PlaceNodeBackInPool(MyNodePool, hit.transform.gameObject, this);
			}
		}
		
	}

}




