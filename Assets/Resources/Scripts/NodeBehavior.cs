using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	public 		bool 			leaf 		= false;

	public 		string 			myPath 		= null;
	public 		string			parentName 	= null;
	
	public 		GameObject 		parent 		= null;

	public 		List<Transform> myKids;

	public Vector3 desiredPos;
	public float speed = 0.5f;

	public string GetNodeFilepath(){
		return this.myPath;
	}

	public void Awake(){
		desiredPos = transform.localPosition;
	}

	// update function that moves node towards desired pos
	public void Update(){
		// every frame, move towards that desiredPos
		Vector3 dir = (desiredPos - transform.localPosition).normalized;
		if(Vector3.Distance(desiredPos, transform.localPosition) < speed * Time.deltaTime){
			transform.localPosition = desiredPos;
		}
		else{
			transform.localPosition += dir * speed * Time.deltaTime;
		}
	}
}