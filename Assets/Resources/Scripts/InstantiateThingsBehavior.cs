using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class InstantiateThingsBehavior : MonoBehaviour {
	
	private static Vector3 ROOTLOCATION;
	List<Dictionary<char, List<string>>> commits;

	public GameObject NodePrefab; 
	public List<GameObject> MyKids;
	
	void Start () {
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
		j_behavior.my_kids.Add (timmy.transform);

		//Actually setting jimmy's transform as a parent for timmy's transform otherwise they wont move. (Now Timmy is actually Jimmy's kid)
		timmy.transform.SetParent (jimmy.transform);

	}

	// Update is called once per frame
	void Update () {
		
	}




}




