using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

public static class NodeUtility {

	public static GameObject PlaceNodeInScene(GameObject currentNode, GameObject parent){
		currentNode.SetActive(false);

		NodeBehavior parentBehavior = parent.GetComponent<NodeBehavior>();
		parentBehavior.myKids.Add(currentNode.transform);

		// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
		currentNode.transform.SetParent (parent.transform);

		currentNode.SetActive(true);

		return SeparateChildren(currentNode, parentBehavior);
	}




	public static GameObject PlaceNodeInScene(List<GameObject> MyNodePool, GameObject parent){
		NodeBehavior parentBehavior = parent.GetComponent<NodeBehavior>();
		
		GameObject currentNode = MyNodePool[0];
		MyNodePool.Remove(currentNode);
		
		parentBehavior.myKids.Add(currentNode.transform);
		
		// Actually setting the parent's transform as the parent of the node's transform. Otherwise they wont move together.
		currentNode.transform.SetParent (parent.transform);
		currentNode.SetActive(true);
		
		return SeparateChildren(currentNode, parentBehavior);
	}




	// Separation of space b/t siblings around a unit circle
	static GameObject SeparateChildren(GameObject currentNode, NodeBehavior parentBehavior){
		foreach(Transform kt in parentBehavior.myKids){
			Vector3 childPos = UnityEngine.Random.onUnitSphere;
			childPos = new Vector3(childPos.x, Mathf.Abs(childPos.y), childPos.z);
			childPos.Normalize();
			childPos *= 4;
			childPos += parentBehavior.centerOfChildren;
			kt.GetComponent<NodeBehavior>().desiredPos = childPos;
		}
		return currentNode;
	}




	public static void RemoveNode(GameObject node, GameManagerBehavior GameManager){
		if(node != null){
			NodeBehavior nodeBehavior = node.GetComponent<NodeBehavior>();
			if(nodeBehavior.parent != null){
				NodeBehavior pb = nodeBehavior.parent.GetComponent<NodeBehavior>();
				pb.myKids.Remove(node.transform);
			}
			GameObject.Destroy(node);
		}
	}




	public static bool StringExistsAsNode(string pathSubstringToFind, GameObject ROOT){
		NodeBehavior rootBehavior = ROOT.GetComponent<NodeBehavior>();

		foreach(Transform kidTransform in rootBehavior.myKids){
			if(kidTransform.GetComponent<NodeBehavior>().GetNodeFilepath() == pathSubstringToFind){
				return true;
			}
		}
		return false; 
	}




	public static GameObject GetNodeWithGivenPath(string pathSubstringToFind, GameObject root){
		NodeBehavior rootBehavior = root.GetComponent<NodeBehavior>();

		foreach(Transform kidTransform in rootBehavior.myKids){
			if(kidTransform.GetComponent<NodeBehavior>().GetNodeFilepath() == pathSubstringToFind){ 
				return kidTransform.gameObject;
			}
		}
		return null;
	}
	
}






