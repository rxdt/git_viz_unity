using UnityEngine;
using System.Collections;

public class RandomSphere : MonoBehaviour {
	
	// Use this for initialization
	void Start () {
		transform.position = Random.insideUnitSphere * 100;
	}
}
