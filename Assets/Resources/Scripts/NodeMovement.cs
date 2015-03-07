using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;

public static class NodeMovement {

	public static void PlaceNodeInSceneMyNodePool(List<GameObject> MyNodePool)
	{
		Debug.Log ("Im placing a node in the scene!");
		GameObject current_node = MyNodePool[0];
		MyNodePool.Remove(current_node);
		current_node.SetActive(true);
		current_node.transform.parent = null;
		current_node.transform.position = new Vector3(0,0,0);
	}



	
	public static void PlaceNodeInScene(List<GameObject> MyNodePool, Vector3 final_position)
	{
		Debug.Log ("Im placing a node in the scene!");
		GameObject current_node = MyNodePool[0];
		MyNodePool.Remove(current_node);
		current_node.SetActive(true);
		current_node.transform.parent = null;
		current_node.transform.position = final_position;
	}




	public static void PlaceNodeBackInPool(List<GameObject> MyNodePool,  GameObject target, GameManagerBehavior GameManager)
	{
		NodeBehavior target_behavior = target.GetComponent<NodeBehavior>();
		foreach(Transform t_kid in target_behavior.myKids)
		{
			PlaceNodeBackInPool(MyNodePool, t_kid.gameObject, GameManager);
		}
		
		Debug.Log ("Im placing a node back to the pool!");
		target.SetActive(false);
		target.transform.SetParent(GameManager.transform);
		MyNodePool.Add(target);
	}
}