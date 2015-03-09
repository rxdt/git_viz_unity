using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	public 		bool 			leaf 		= false;

	public 		string 			myPath 		= null;
	public 		string			parentName 	= null;
	
	public 		GameObject 		parent 		= null;

	public 		List<Transform> myKids;

	public string GetNodeFilepath(){
		return this.myPath;
	}
}