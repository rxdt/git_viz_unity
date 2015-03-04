using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class GameManager : MonoBehaviour {
	
	public GameObject sphere;
	public GameObject Tree;
	public Node root;
	private static Vector3 ROOTLOCATION;

	List<Dictionary<char, List<string>>> commits = new List<Dictionary<char, List<string>>>();
	public int nodeCount = 3;

	void Start(){
		createDummyCommitsList();

		// the start of tree trunk and center of our environment - child of terrain and GameManager
		ROOTLOCATION = new Vector3(0, 0, 0);

		root = parseJSON (); // returns reference to 'root' node of repo
		createNode(root);

		createToyTree();
	}

	/**
	 * This creates a new node x,y,z distance from its parent.
	 **/
	public void createNode(Node parent){
		Node node = new Node(null, root, "filename whatever");
//		Vector3 newNodeVector = root;
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
		return new Node ();
	}

	// interacts with OR to render things
	public void renderTree(){
		// create branch
		// connect nodes to branch
		Instantiate (sphere, new Vector3(2, 0, 88), Quaternion.identity);
		Instantiate (Tree, ROOTLOCATION, Quaternion.identity);
	}

	public void createDummyCommitsList(){
		for(int i = 0; i < nodeCount; i++){
			Dictionary<char, List<string>> commit1 = new Dictionary<char, List<string>>();
			List<string> list1 = new List<string>();
			list1.Add("file_one");
			list1.Add("file_two");
			list1.Add("file_three");
			commit1['A'] = list1;
			commits.Add(commit1);
		}
		Debug.Log("\t\t\tHELLO\t\t!!!!!!!");
	}
}

