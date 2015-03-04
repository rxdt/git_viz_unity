using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {
	
	public GameObject sphere;
	public GameObject Tree;
	public Node root;

	private static Vector3 ROOTLOCATION;

	void Start(){
		root = parseJSON (); // returns refernece to 'root' node of repo
		renderTree ();
		ROOTLOCATION = new Vector3(0, 0, 0);
	}

	// returns root node of tree
	public Node parseJSON(){
		// open JSON.txt file
				// json_string = open_file;
		// deserialize JSON to tree object
				// buildTree(json_string);
		//values = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

		// currently, returns one node 
		return new Node ();
	}

	// interacts with OR to render things
	public void renderTree(){
		// create branch
		// connect nodes to branch
		Instantiate (sphere, new Vector3(2, 0, 88), Quaternion.identity);
		Instantiate (Tree, ROOTLOCATION, Quaternion.identity);
	}
}

