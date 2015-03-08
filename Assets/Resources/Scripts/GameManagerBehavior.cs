using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class GameManagerBehavior : MonoBehaviour {

	private const  	int 			    MAX_NODE_POOL = 500;
	public 		   	List<GameObject>  	MyNodePool;
	public 		   	GameObject	    	NodePrefab; 
	public 		   	List<GameObject> 	MyKids; 
	private static 	int			    	commitNum;
	private static 	GameObject			root;
	public		   	string 				filesAction;
	private			GameObject			parent;

	// The pseudo-root never changes.
	private static 	GameObject 			ROOT; 
	private static 	NodeBehavior 		rootBehavior;

	// Off-center of scene center and below terrain surface is the tree's pseudo-root. 
	// Position is relative to parent GameManager as set in createNullRoot()
	private static  Vector3 			ROOTLOCATION = new Vector3(0, -2, 53); 
	private 		Queue 				bfsQueue 	 = new Queue();

	// Returns a List of dictinoaries. 
	// Each dictionary is one commit with the key a character and the value as a list of strings/filnames.
	List<
		Dictionary<
			string, List<string>>> 		commits = Parser.parseCommitLog("");




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
		rootBehavior = ROOT.GetComponent<NodeBehavior> ();

		// root's parent is the game manager which is at 0,0,0 the center of world
		rootBehavior.transform.SetParent(this.transform); 

		return ROOT;
	}

	// NODEBEHAVIOR ATTRIBUTES
//	public bool leaf default false;
//	public string myPath;
//	public GameObject parent default null;
//	public List<Transform> myKids;

	//check for the first commit (commit[0])
	//logically build the tree.
	//place the nodes in the scene using something like PlaceNodeInScene()
	void createTree(){

		// sets global static ROOT game object and rootBehavior
		createNullRoot(); 
		commitNum = 0;		

		// Each time through the commits List gives us a dictionary that represents one commit
		foreach( Dictionary<string, List<string>> d in commits ){
			parseSingleCommit(d);
			commitNum++;
		}
	}

	void createNode(Vector3 start, string myPath){
		GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
		NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
//		nodeBehavior.myPath = myPath;
//		nodeBehavior.parent = parent;
//		MyKids.Add (node);
	}

	// Gets us the key and its associated files list
	void parseSingleCommit(Dictionary<string, List<string>> d){

		// for each key->value pair (letter->fileslist)
		foreach(KeyValuePair<string, List<string>> files in d){

			// for each key of the key->value pairs
			foreach(string key in d.Keys){

				// get the list of files associated with this particular key in this particular commit (e.g. the A/Additions in commit no.0)
				List<string> listToAffect = d[key];

				switch(key){

					case "A":
						// actual list of files to be Added
						foreach(string filePath in listToAffect){

							// split the filename string
							string[] singleFilePathArray = filePath.Split ('/');
		
							for(int i = 0; i < singleFilePathArray.Length; i++){

								string pathSubstring = singleFilePathArray[i];

								if(!stringExistsAsNode(pathSubstring)){
									// create node object
									GameObject node = NodeMovement.PlaceNodeInSceneMyNodePool(MyNodePool);
									
									// sets node behavior
									NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();

									// sets its parent 
									nodeBehavior.parent = parent;
									
									// adds GameObject reference to GameManager MyKids list for future use
									MyKids.Add(node); 

									if(commitNum == 0){
										rootBehavior.myKids.Add(node.transform);
									}	
									else{
										// accesses parent and adds a reference of the new node as being a child of parent
										NodeBehavior parentBehavior = node.GetComponent<NodeBehavior> ();
										parentBehavior.myKids.Add (node.transform);
									}

									// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
									node.transform.SetParent (parent.transform);

									if(i == singleFilePathArray.Length - 1){
										// filepath has a leaf node at the end i.e. when we're at the end of singleFilePathArray
										nodeBehavior.leaf = true;
										// start back at base pseudo-root
										parent = ROOT;
									}
									else{
										parent = nodeBehavior.parent;
									}
								}
							}
						}
						break;

					case "D":
//						NodeMovement.PlaceNodeBackInPool(MyNodePool, getNode(), this);
						break;

					case "M":
						NodeMovement.showModificationEffect(getNode());
						break;

					default:
						break;
				}
			}
		}
	}

	GameObject getNode(){
		return null;
	}

	bool stringExistsAsNode(string baseOfString){

//		foreach(NodeBehavior child in rootBehavior){
//
//		}
//
//		if(ROOT.child.pathname != baseOfString){
//			bfsQueue.push(node);
//			node.visited = true;
//		}

		return false; 
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







//
//		void create(){
//			GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
//			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
//			nodeBehavior.myPath = "";
//			MyKids.Add (node);
//
//		//Instantiate a Node from NodePrefab var; 
//		GameObject jimmy = (GameObject)Instantiate(NodePrefab, new Vector3(-1.0f, 0, 0), Quaternion.identity);
//
//		//Keeping the gameobject reference from Jimmy for later use
//		MyKids.Add (jimmy);
//
//		//Instantiate a Bananas from SquarePrefab var;	
//		GameObject timmy = (GameObject)Instantiate(NodePrefab, new Vector3(0, 1.0f, 0), Quaternion.identity);
//
//		//Keeping the gameobject reference from Timmy for later use
//		MyKids.Add (timmy);
//		
//		//Accessing Jimmy NodeBehavior component because that's where his children list will be.
//		NodeBehavior j_behavior = jimmy.GetComponent<NodeBehavior> ();
//		
//		//Adding timmy as child to jimmy's kids (var my_kids) (Note that Im just keeping their references, not actually setting them as kids)
//		j_behavior.myKids.Add (timmy.transform);
//		
//		//Actually setting jimmy's transform as a parent for timmy's transform otherwise they wont move. (Now Timmy is actually Jimmy's kid)
//		timmy.transform.SetParent (jimmy.transform);
//
//	}



}




