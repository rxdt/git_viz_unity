using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class Node : MonoBehaviour {
	public string filename 		{ get; set; }
	public Node parent 			{ get; set; }
	public List<Node> children;
	public GameObject sphere;
	private static Dictionary<char, List<string>> commit;
	Vector3 offset = new Vector3(10, 10, 10);

	void Start(){
		createDummyCommitsList();
		createTree();
	}
	
	public void createTree(){
		for(int nodeCount = 5; nodeCount > 0; nodeCount--){
			Instantiate(sphere, offset, Quaternion.identity); 
			offset = offset + offset;
			Debug.Log("\t\t\t Invoked \t\t!!!!!!!");
		}
	}
	
	public void createDummyCommitsList(){
		commit = new Dictionary<char, List<string>>();
		List<string> list = new List<string>();
		list.Add("file_one");
		list.Add("file_two");
		list.Add("file_three");
		commit['A'] = list;
	}
}
