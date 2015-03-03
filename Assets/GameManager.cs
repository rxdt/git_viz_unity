using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {
	
	public GameObject ROOTLOCATION;
	public GameObject sphere;
	private static Dictionary<string, string> values;
	public Node root;

	void Start(){
		ROOTLOCATION = GameObject.Find ("ROOTLOCATION");
		root = parseJSON (); // returns refernece to 'root' node of repo
		renderTree ();
	}

	// returns root node of tree
	public Node parseJSON(){
		// open JSON.txt file
				// json_string = open_file;
		// deserialize JSON to tree object
				// buildTree(json_string);
		//values = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

		// currently, returns one node 
		Node node = new Node ();
		return node;
	}

	// interacts with OR to render things
	public void renderTree(){
		// create branch
		// connect nodes to branch
		Instantiate (sphere, new Vector3(2, 4, 88), Quaternion.identity);
	}
}


public class Node {
	public string filename { get; private set; }
	public Node parent;
	public List<Node> children;
}