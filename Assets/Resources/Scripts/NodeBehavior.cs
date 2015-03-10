using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	private LineRenderer line;
	private float rotationSpeed = 1;
	private int rotDir = 1;
	private float swayTime = 1;

	public 		bool 			leaf 		= false;

	public 		string 			myPath 		= null;
	public 		string			parentName 	= null;
	
	public 		GameObject 		parent 		= null;

	public 		List<Transform> myKids;

	public Vector3 desiredPos;
	public float speed = 0.8f;

	public string GetNodeFilepath(){
		return this.myPath;
	}

	public void Start(){
		StartCoroutine(sway());
	}

	private IEnumerator sway(){
		float swayTimer = 0;
		while(Application.isPlaying){
			while(swayTimer < swayTime){
				transform.RotateAround(transform.position, transform.forward, rotationSpeed*Time.deltaTime);
				swayTimer += Time.deltaTime;
				yield return null;
			}
			while(swayTimer > 0){
				transform.RotateAround(transform.position, transform.forward, -rotationSpeed*Time.deltaTime);
				swayTimer -= Time.deltaTime;
				yield return null;
			}
		}
	}

	public void Awake(){
		desiredPos = transform.localPosition;
		line = GetComponent<LineRenderer>();
	}

	// update function moves node towards desired pos
	public void Update(){
		// every frame, move towards that desiredPos
		Vector3 dir = (desiredPos - transform.localPosition).normalized;
		if(Vector3.Distance(desiredPos, transform.localPosition) < speed * Time.deltaTime){
			transform.localPosition = desiredPos;
		}
		else{
			transform.localPosition += dir * speed * Time.deltaTime;
		}

		if(parent != null){
			line.SetPosition(0, parent.transform.position);
			line.SetPosition(1, transform.position);
		}
	}
}