using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

public static class NodeMovement {

	public static GameObject PlaceNodeInSceneMyNodePool(List<GameObject> MyNodePool)
	{
//		Debug.Log ("Im placing a node in the scene!");
		GameObject currentNode = MyNodePool[0];
		MyNodePool.Remove(currentNode);
		currentNode.SetActive(true);
		currentNode.transform.parent = null;
		currentNode.transform.position = new Vector3(0,0,0);
		return currentNode;
	}



	
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
		NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior>();
		foreach(Transform nodeChildren in nodeBehavior.myKids)
		{
			PlaceNodeBackInPool(MyNodePool, nodeChildren.gameObject, GameManager);
		}
		
//		Debug.Log ("Im placing a node back to the pool!");
		node.SetActive(false);
		node.transform.SetParent(GameManager.transform);
		MyNodePool.Add(node);
	}




	public static void showModificationEffect(GameObject node){}
}






