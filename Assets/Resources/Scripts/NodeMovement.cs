using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

public static class NodeMovement {

	public static GameObject PlaceNodeInSceneMyNodePool(List<GameObject> MyNodePool, GameObject parent){
		int numChildren = parent.GetComponent<NodeBehavior>().myKids.Count;
		GameObject currentNode = MyNodePool[0];
		MyNodePool.Remove(currentNode);

		// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
		currentNode.transform.SetParent (parent.transform);
		currentNode.SetActive(true);

		float angle = 360.0f / numChildren; // separation b/t siblings around a unit circle
		float radians = Mathf.Deg2Rad * angle;
		
		for (int i = 0; i < numChildren; ++i){
			Vector3 childPos = new Vector3();
			childPos.x = Mathf.Cos(i*radians);
			childPos.z = -Mathf.Sin (i*radians);
			
			currentNode.transform.position = childPos * 2;
			currentNode.transform.position += Vector3.up * 6;
		}

		return currentNode;
	}




//	float transformChild(int numChildren){
//		return 0;
//	}




	public static GameObject PlaceNodeInScene(List<GameObject> MyNodePool, Vector3 finalPosition)
	{
//		Debug.Log ("Im placing a node in the scene!");
		GameObject currentNode = MyNodePool[0];
		MyNodePool.Remove(currentNode);
		currentNode.SetActive(true);
		currentNode.transform.parent = null;
		currentNode.transform.position = finalPosition;
		return currentNode;
	}





	public static void PlaceNodeBackInPool(List<GameObject> MyNodePool,  GameObject node, GameManagerBehavior GameManager)
	{
		if(node != null){
			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior>();

			foreach(Transform nodeChildren in nodeBehavior.myKids)
			{
				PlaceNodeBackInPool(MyNodePool, nodeChildren.gameObject, GameManager);
			}
//			Debug.Log ("Im placing a node back to the pool!");
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
		Debug.Log(" pathsubstring of file/node to get visual: " + pathSubstring);
	}
}






