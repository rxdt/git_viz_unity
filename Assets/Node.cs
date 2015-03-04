using UnityEngine;
using System.Collections;
using System.Collections.Generic;


public class Node : MonoBehaviour {
	public string filename { get; set; }
	public Node parent;
	public List<Node> children; // do i need if i am already tracking the parent/

	public Node(){}

	public Node(List<Node> children, Node parent, string filename){
		this.children = children;
		this.parent = parent;
		this.filename = filename;
	}

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
