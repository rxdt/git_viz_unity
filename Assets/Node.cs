using UnityEngine;
using System.Collections;


public class Node : MonoBehaviour {
	public string filename 		{ get; set; }
	public Node parent 			{ get; set; }
	public GameObject sphere;

	void Start(){
		makeSphere();
	}

	public void makeSphere(){
		Instantiate(sphere, new Vector3(3, 76, 100), Quaternion.identity); 
	}
}
