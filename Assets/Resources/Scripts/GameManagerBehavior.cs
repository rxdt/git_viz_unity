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

	private const  int 			    MAX_NODE_POOL = 500;
	public 		   List<GameObject> MyNodePool;
	public 		   GameObject	    NodePrefab; 
	public 		   List<GameObject> MyKids; 
	private static int			    commitNum;
	private static GameObject		root;
	public		   string 			filesAction;
	

	// returns a List of dictinoaries. Each dictionary is one commit with the key a character and the value a list of strings/filnames;
	List<
		Dictionary<
			string, List<string>>> commits = Parser.parseCommitLog("");

	// center of scene
	private static Vector3 ROOTLOCATION = new Vector3(0, 0, 0); 


	void Start () {

		// creates the pool of 1000 node clones ready for use in the scene as needed
		for(int count = 0; count < MAX_NODE_POOL; count++)
		{
			GameObject currentNode = (GameObject)Instantiate(NodePrefab, new Vector3(-1.0f, 0, 0), Quaternion.identity);
			MyNodePool.Add(currentNode);
			currentNode.transform.SetParent(this.transform);
			currentNode.SetActive(false);
		} 

		createTree ();
	}

//	public bool fileLeaf;
//	public string myPath;
//	public GameObject parent;
//	public List<Transform> myKids;

	//check for the first commit (commit[0])
	//logically build the tree.
	//place the nodes in the scene using something like PlaceNodeInScene()
	void createTree(){

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


		foreach(KeyValuePair<string, List<string>> files in d){

			foreach(string key in d.Keys){



				switch(key){
					case "A":
						Debug.Log ("CASE A");

						// actual list of files to go into innermost list
						foreach(string file in files.Value){
							if(commitNum == 0){
								createNode(ROOTLOCATION, null);
							}
							else{
								int numFiles = 0;
							}
						}
						break;
					case "D":
						Debug.Log ("CASE B");
						break;
					case "M":
						Debug.Log ("CASE C");
						break;
					default:
						Debug.Log ("default fell through");
						break;
				}
			}



		}
	}

	float transformChild(int numChildren){

		float angle = 360.0f / numChildren; // separation b/t siblings 
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




