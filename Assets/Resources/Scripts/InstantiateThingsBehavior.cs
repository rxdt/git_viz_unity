using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;
using System.Linq;

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
		// for each each commit within the entire commit log i.e. each dictionary in commits do this...
		for(int i = 0; i < commitsLog.Count; i++){
			// pull out one commit
//			singleCommit = commitsLog[(char)i];

			GameObject node = (GameObject)Instantiate(NodePrefab, start, Quaternion.identity);
			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior> ();
//			nodeBehavior.myPath = commits[0][i];

			MyKids.Add (node);
		}


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




