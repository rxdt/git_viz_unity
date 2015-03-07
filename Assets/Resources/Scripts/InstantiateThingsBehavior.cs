using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class InstantiateThingsBehavior : MonoBehaviour {
	private const int MAX_NODE_POOL = 100;
	public List<GameObject> MyNodePool;

	private static Vector3 ROOTLOCATION;
	public List<Dictionary<string, List<string>>> commits = Parser.parseCommitLog("");

	public GameObject NodePrefab; 
	public List<GameObject> MyKids; 

	Vector3 start = new Vector3(0, 0, 0); // center of scene

	void Start () {
		createTree ();
	}

	void createTree(){
		int commitNum = 0;		
		
		// 1st for loop gives us an inner dictionary from commits-list
		foreach( Dictionary<string, List<string>> d in commits ){
			
			// 2nd gets us the key and its associated files list
			foreach(KeyValuePair<string, List<string>> files in d){
				
				// actual list of files to go into innermost list
				foreach(string file in files.Value){
					int numFiles = 0;
					
					Debug.Log (file);
				}
			}
			commitNum++; 
		}
	}

	float transformChild(int numChildren){

		float angle = 360.0f / numChildren; // separation b/t siblings 
		float radians = Mathf.Deg2Rad * angle;
		
		for (int i = 0; i < numChildren; ++i){
			Vector3 childPos = new Vector3();
			childPos.x = Mathf.Cos(i*radians);
			childPos.z = -Mathf.Sin (i*radians);
			
			GameObject n = GameObject.CreatePrimitive(PrimitiveType.Sphere);
			
			n.transform.position = childPos * 5;
			n.transform.position += Vector3.up * 2;
		}

		return 0;
	}














//
//		void create(){
//			GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
//			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
//			nodeBehavior.myPath = "";
//			MyKids.Add (node);
//
//		//Instantiate a Node from NodePrefab var; 
//		GameObject jimmy = (GameObject)Instantiate(NodePrefab, new Vector3(-1.0f, 0, 0), Quaternion.identity);
//
//		//Keeping the gameobject reference from Jimmy for later use
//		MyKids.Add (jimmy);
//
//		//Instantiate a Bananas from SquarePrefab var;	
//		GameObject timmy = (GameObject)Instantiate(NodePrefab, new Vector3(0, 1.0f, 0), Quaternion.identity);
//
//		//Keeping the gameobject reference from Timmy for later use
//		MyKids.Add (timmy);
//		
//		//Accessing Jimmy NodeBehavior component because that's where his children list will be.
//		NodeBehavior j_behavior = jimmy.GetComponent<NodeBehavior> ();
//		
//		//Adding timmy as child to jimmy's kids (var my_kids) (Note that Im just keeping their references, not actually setting them as kids)
//		j_behavior.myKids.Add (timmy.transform);
//		
//		//Actually setting jimmy's transform as a parent for timmy's transform otherwise they wont move. (Now Timmy is actually Jimmy's kid)
//		timmy.transform.SetParent (jimmy.transform);
//
//	}



}




