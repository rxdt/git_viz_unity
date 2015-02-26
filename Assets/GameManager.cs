using UnityEngine;
using System.Collections;

public class GameManager : MonoBehaviour {
	
	public GameObject sphere;

	void Start(){
		for (int i = 0; i < 100; i++) {
			Instantiate(sphere);
		}
	}
}
