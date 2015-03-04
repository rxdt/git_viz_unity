using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {
	
	private static Vector3 ROOTLOCATION;
	List<Dictionary<char, List<string>>> commits;

	void Start(){
		commits = Parser.createDummyCommitsList(3);

		// the start of tree trunk and center of our environment - child of terrain and GameManager
		ROOTLOCATION = new Vector3(0, 0, 0);
		createNode(null, ROOTLOCATION);		

		createToyTree();
	}

	/**
	 * This creates a new node x,y,z distance from its parent.
	 **/
	public void createNode(Node parent, Vector3 coordinates){
		Node node = ScriptableObject.CreateInstance<Node>(); //Node<List<Node>, Node, string, Vector3
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
		Node node = ScriptableObject.CreateInstance<Node>(); //Node<List<Node>, Node, string, Vector3
		return node;
	}

	// interacts with OR to render things
	public void renderTree(){
		// create branch
		// connect nodes to branch
	}


}

