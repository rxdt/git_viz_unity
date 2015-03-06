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
	
	private static Vector3 ROOTLOCATION;
	public Dictionary<string, List<string>> singleCommit;
	public List<Dictionary<string, List<string>>> commitsLog = Parser.parseCommitLog("");

	public GameObject NodePrefab; 
	public List<GameObject> MyKids; 

	Vector3 start = new Vector3(0, 0, 0);
	Vector3 offset = new Vector3(10, 10, 10); // start = start+offset; inside of commits if new node instantiated after parent

	void Start () {
		createTree ();
	}

	void createTree(){
		int i = 0;		
		
		// 1st for loop gives us an inner dictionary from commits-list
		foreach( Dictionary<string, List<string>> d in commits ){
			Debug.Log ("commit " + i);
			
			// 2nd gets us each list associated with a particular key in the inner dictionary
			//						foreach(List<string> files in d.Values){
			
			// 2nd gets us the key and its associated files list
			foreach(KeyValuePair<string, List<string>> files in d){
				
				// actual list of files to go into innermost list
				//							foreach(string file in files){
				
				Debug.Log (files.Key);
				
				// actual list of files to go into innermost list
				foreach(string file in files.Value){
					Debug.Log (file);
					GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
					NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
					nodeBehavior.myPath = file;
					MyKids.Add(node);
					if(i == 0){
						root = nodeBehavior;
					}
					bool fileLeaf = true;
					file.EndsWith('/') == 0 ? fileLeaf : fileLeaf = false;
				}
			}
			i++; 
		}
	}

		void create(){
			GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
			nodeBehavior.myPath = "";
			MyKids.Add (node);


		//Instantiate a Node from NodePrefab var; 
		GameObject jimmy = (GameObject)Instantiate(NodePrefab, new Vector3(-1.0f, 0, 0), Quaternion.identity);

		//Keeping the gameobject reference from Jimmy for later use
		MyKids.Add (jimmy);

		//Instantiate a Bananas from SquarePrefab var;	
		GameObject timmy = (GameObject)Instantiate(NodePrefab, new Vector3(0, 1.0f, 0), Quaternion.identity);

		//Keeping the gameobject reference from Timmy for later use
		MyKids.Add (timmy);
		
		//Accessing Jimmy NodeBehavior component because that's where his children list will be.
		NodeBehavior j_behavior = jimmy.GetComponent<NodeBehavior> ();
		
		//Adding timmy as child to jimmy's kids (var my_kids) (Note that Im just keeping their references, not actually setting them as kids)
		j_behavior.myKids.Add (timmy.transform);
		
		//Actually setting jimmy's transform as a parent for timmy's transform otherwise they wont move. (Now Timmy is actually Jimmy's kid)
		timmy.transform.SetParent (jimmy.transform);

	}



}




