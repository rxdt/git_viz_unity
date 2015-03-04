using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {
	
	private static Vector3 ROOTLOCATION;
	List<Dictionary<char, List<string>>> commits;
	public GameObject sphere;
	public int nodeCount = 10;

	void Start(){
		commits = Parser.createDummyCommitsList(3);

		// the start of tree trunk and center of our environment - child of terrain and GameManager
		ROOTLOCATION = new Vector3(-9, 5.7f, 125);
		Vector3 root = ROOTLOCATION;
		GameObject parent = createSphere(null, ROOTLOCATION);	
		Vector3 offset = new Vector3(10, 10, 10);

//		while(nodeCount > 0){
//			Vector3 newVector = root + offset;
//			parent = createSphere(parent, newVector);
//			root = newVector;
//			nodeCount--;
//		}

		createToyTree();
	}

	/**
	 * This creates a new node x,y,z distance from its parent.
	 * what if i create a dictionary that "contains" nodes and spheres somehow
	 **/
	public GameObject createSphere(GameObject parent, Vector3 coordinates){
//		Instantiate (sphere, coordinates, Quaternion.identity); 
		return sphere;

//		Node node = new Node(coordinates, parent);
//		return node;
	}

	public void createToyTree(){
	}

	// returns root node of tree
	public Node parseJSON(){
		// open JSON.txt file
				// json_string = open_file;
		// deserialize JSON to tree object
				// buildTree(json_string);
		//values = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

		// currently, returns one node 
		Node node = new Node(); //Node<List<Node>, Node, string, Vector3
		return node;
	}

	// interacts with OR to render things
	public void renderTree(){
		// create branch
		// connect nodes to branch
	}
 }
//
//public class Node : MonoBehaviour {
//	public string filename 		{ get; set; }
//	public Node parent 			{ get; set; }
//	public GameObject sphere;
//	
//	public Node(){}
//	
//	public Node(Node parent){
//		this.parent = parent;
////		makeSphere(coordinates);
//	}
//	
//	public GameObject makeSphere(Vector3 coordinates){
//		GameObject clone = (GameObject)Instantiate(sphere, coordinates, Quaternion.identity); 
//		return clone;
//	}
//}






