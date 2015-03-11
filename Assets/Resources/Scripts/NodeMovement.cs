using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

public static class NodeMovement {

	public static GameObject PlaceNodeInSceneMyNodePool(List<GameObject> MyNodePool, GameObject parent){
		NodeBehavior parentBehavior = parent.GetComponent<NodeBehavior>();
		GameObject currentNode = MyNodePool[0];
		MyNodePool.Remove(currentNode);
		parentBehavior.myKids.Add(currentNode.transform);
		
		// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
		currentNode.transform.SetParent (parent.transform);
		currentNode.SetActive(true);

		return separateChildren(currentNode, parentBehavior);
	}




	// Separation of space b/t siblings around a unit circle
	static GameObject separateChildren(GameObject currentNode, NodeBehavior parentBehavior){
		int i = 0;
		int numChildren = parentBehavior.myKids.Count;
		
		float angle = 360.0f / numChildren; 
		float radians = Mathf.Deg2Rad * angle;
		
		foreach(Transform kidTransform in parentBehavior.myKids){
			Vector3 childPos = new Vector3();
			childPos.x = Mathf.Cos(i*radians);
			childPos.z = -Mathf.Sin (i*radians);
			
			Debug.Log(i*radians*Mathf.Rad2Deg + ": " + childPos);
			
			kidTransform.GetComponent<NodeBehavior>().desiredPos = childPos * 3 + Vector3.up * 2;
			
			i++;
		}
		return currentNode;
	}



	//	Placing a node back into the pool	
	public static void PlaceNodeBackInPool(List<GameObject> MyNodePool,  GameObject node, GameManagerBehavior GameManager){
		if(node != null){
			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior>();

			foreach(Transform nodeChildren in nodeBehavior.myKids)
			{
				PlaceNodeBackInPool(MyNodePool, nodeChildren.gameObject, GameManager);
			}

			node.SetActive(false);
			node.transform.SetParent(GameManager.transform);
			MyNodePool.Add(node);
		}
	}




	public static bool stringExistsAsNode(string pathSubstringToFind, GameObject ROOT){
		NodeBehavior rootBehavior = ROOT.GetComponent<NodeBehavior>();

		foreach(Transform kidTransform in rootBehavior.myKids){
			if(kidTransform.GetComponent<NodeBehavior>().GetNodeFilepath() == pathSubstringToFind){
				return true;
			}
		}
		return false; 
	}




	public static GameObject getNodeWithGivenPath(string pathSubstringToFind, GameObject root){
		NodeBehavior rootBehavior = root.GetComponent<NodeBehavior>();
		foreach(Transform kidTransform in rootBehavior.myKids){
			if(kidTransform.GetComponent<NodeBehavior>().GetNodeFilepath() == pathSubstringToFind){ 
				return kidTransform.gameObject;
			}
		}
		return null;
	}




	public static void showModificationEffect(GameObject node, string pathSubstring){
//		Debug.Log(" pathsubstring of file/node to get visual: " + pathSubstring);
	}
}






