using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class NodeBehavior : MonoBehaviour {

	public bool fileLeaf;
	public string myPath;
	public GameObject parent;
	public List<Transform> myKids;
	
	//A calls OnDestroy()
	//A has B and C as kids
	//B calls OnDestroy()
	//D calls OnDestroy()
	//D has no kids
	//D suicides
	//B continues the foreach
	//B sees no kids
	//B suicides
	//C calls OnDestroy()
	//C has no kids
	//C suidides
	//A no longer has kids
	//A suicides
	
	//this will always be called whenever we call a Destroy() on a gameobject, before it is actually destroyed.
	public void OnDestroy()
	{
		foreach (Transform kid_t in myKids) {
			//By destroying the object by calling the Destroy method below, the kid's OnDestroy() method will be called first.
			//That's why we don't need to call OnDestroy() directly for the kid.
			//NodeBehavior kid_b = kid_t.GetComponent<NodeBehavior>();
			Destroy(kid_t.gameObject);
			
		}
		//I dont actually need to call Destroy() on myself, because someone already, hence triggered OnDestroy()
		//Destroy(this.gameObject);
	}
}
