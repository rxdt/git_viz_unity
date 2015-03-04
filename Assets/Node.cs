using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class Node : ScriptableObject {
	public string filename 		{ get; set; }
	public Node parent 			{ get; set; }
	public List<Node> children 	{ get; set; } // do i need if i am already tracking the parent?
	public Vector3 coordinates 	{ get; set; }
	public GameObject sphere;
	
	public void setCoordinates(){
//		Instantiate (this.sphere, this.coordinates, Quaternion.identity); 
		Debug.Log ("Does this get here?");
	}
	
	// Update is called once per frame
	void Update () {
	}
}