using UnityEngine;
using System.Collections;

public class CreatePoints : MonoBehaviour {

	public int numChildren = 3;

	// Use this for initialization
	void Start () {

		float angle = 360.0f / numChildren; // separation b/t siblings 
		float radians = Mathf.Deg2Rad * angle;

		for (int i = 0; i < numChildren; ++i) {
			Vector3 childPos = new Vector3();
			childPos.x = Mathf.Cos(i*radians);
			childPos.z = -Mathf.Sin (i*radians);

			GameObject n = GameObject.CreatePrimitive(PrimitiveType.Sphere);

			n.transform.position = childPos * 5;
			n.transform.position += Vector3.up * 2;

		}
	
	}
}
