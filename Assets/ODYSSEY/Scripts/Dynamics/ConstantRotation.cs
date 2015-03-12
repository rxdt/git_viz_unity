using UnityEngine;
using System.Collections;

public class ConstantRotation : MonoBehaviour {
	
	Quaternion initialRotation;
	
	public Vector3 axis = Vector3.one.normalized;
	public float deltaRotationAngle = 1.0f;
	
	private float angleRot = 0f;
	
	// Use this for initialization
	void Start () {
		axis = axis.normalized;
		initialRotation = transform.rotation;
	}
	
	// Update is called once per frame
	void Update () {
		angleRot += deltaRotationAngle;
		if(angleRot >= 360f) {
			angleRot = 0f;
		}
		transform.localRotation = Quaternion.AngleAxis(angleRot, axis);
	}
}
