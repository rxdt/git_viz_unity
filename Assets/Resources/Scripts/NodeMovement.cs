using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public static class NodeMovement {

	public static void PlaceNodeInScene()
	{
		print ("Im placing a node in the scene!");
		GameObject current_node = MyNodePool[0];
		MyNodePool.Remove(current_node);
		current_node.SetActive(true);
		current_node.transform.parent = null;
		current_node.transform.position = new Vector3(0,0,0);
	}
	
	public static void PlaceNodeInScene(Vector3 final_position)
	{
		print ("Im placing a node in the scene!");
		GameObject current_node = MyNodePool[0];
		MyNodePool.Remove(current_node);
		current_node.SetActive(true);
		current_node.transform.parent = null;
		current_node.transform.position = final_position;
	}
	
	public static void PlaceNodeBackInPool(GameObject target)
	{
		NodeBehavior target_behavior = target.GetComponent<NodeBehavior>();
		foreach(Transform t_kid in target_behavior.my_kids)
		{
			PlaceNodeBackInPool(t_kid.gameObject);
		}
		
		print ("Im placing a node back to the pool!");
		target.SetActive(false);
		target.transform.SetParent(this.transform);
		MyNodePool.Add(target);
	}
}