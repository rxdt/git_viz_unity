using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	public bool leaf = false;
	public string myPath = null;
	public GameObject parent = null;

	// may make this into a dictionary later
	public List<Transform> myKids;
	public List<string> kidNames;

	public bool visited = false;

}