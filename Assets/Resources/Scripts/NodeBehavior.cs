using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	public 		bool 			visited 	= false;
	public 		bool 			leaf 		= false;

	public 		string 			myPath 		= null;
	public 		string			parentName 	= null;
	
	public 		GameObject 		parent 		= null;

	// may make these into one dictionary later:
	public 		List<Transform> myKids;
	public 		List<string> 	kidNames;

}