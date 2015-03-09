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
			GameObject currentNode = (GameObject)Instantiate(NodePrefab, new Vector3(0, 0, 0), Quaternion.identity);
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

		// the first 'parent' is the ROOT
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




	void createNode(Vector3 start, string myPath){
//		GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
//		NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
//		nodeBehavior.myPath = myPath;
//		nodeBehavior.parent = parent;
//		MyKids.Add (node);
	}




	// Gets us the key and its associated files list
	void parseSingleCommit(Dictionary<char, List<string>> d){

		// for each key of the key->value pairs
		foreach(char key in d.Keys){

			// get the list of files associated with this particular key in this particular commit (e.g. the A/Additions in commit no.0)
			List<string> listToAffect = d[key];

			switch(key){

				case 'A':

					// actual list of files to be Added
					foreach(string filePath in listToAffect){

						// start back at base pseudo-root
						parent = ROOT;
						parentBehavior = ROOT.GetComponent<NodeBehavior> ();	

						// split the filename string
						string[] singleFilePathArray = filePath.Split ('/');
	
						for(int directoryLevel = 0; directoryLevel < singleFilePathArray.Length; directoryLevel++){

							string pathSubstring = singleFilePathArray[directoryLevel];
							
							if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false){

								// create node object & get node class
								GameObject node = NodeMovement.PlaceNodeInSceneMyNodePool(MyNodePool);
								NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();

								// accesses parent and adds a reference of the new node as being a child of parent
								parentBehavior = parent.GetComponent<NodeBehavior> ();
								parentBehavior.myKids.Add(node.transform);
								nodeBehavior.parent = parent;
								nodeBehavior.myPath = singleFilePathArray[directoryLevel];

								// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
								node.transform.SetParent (parent.transform);

								// finishing up one file's entire path
								if(directoryLevel == singleFilePathArray.Length - 1){
									// filepath has a leaf node at the end i.e. when we're at the end of singleFilePathArray
									nodeBehavior.leaf = true;
								}
								else{
									parent = node;
									parentBehavior = node.GetComponent<NodeBehavior>();
								}

							} // close if(NodeMovement.stringExistsAsNode(pathSubstring, parent) == false)


							else{
							Debug.Log ("in the outer ELSE substring == " + pathSubstring);
								parent = NodeMovement.nodeWithGivenPath(pathSubstring, parent); // get node GameObject
								parentBehavior = parent.GetComponent<NodeBehavior>();
							} // close else


						} // close for loop
					}
					break;

				case 'D':
//						NodeMovement.PlaceNodeBackInPool(MyNodePool, getNode(), this);
					break;

				case 'M':
					//NodeMovement.showModificationEffect(getNode());
					break;

				default:
					break;
			}
		}
	}




	float transformChild(int numChildren){

		float angle = 360.0f / numChildren; // separation b/t siblings around a unit circle
		float radians = Mathf.Deg2Rad * angle;
		
		for (int i = 0; i < numChildren; ++i){
			Vector3 childPos = new Vector3();
			childPos.x = Mathf.Cos(i*radians);
			childPos.z = -Mathf.Sin (i*radians);
			
			GameObject n = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			
			n.transform.position = childPos * 5;
			n.transform.position += Vector3.up * 2;
		}

		return 0;
	}




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




