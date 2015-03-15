using System;
using UnityEngine;
using UnityEngine.UI;

public class GameBillboardText : MonoBehaviour
{
	public Transform Target;
	public String Text = "Filename";
	public Text TextUI;

	protected void Awake(){	
//		Target = GameManagerBehavior.OVRCameraRig.
		SetText(Text);
	}

	public void SetText(string text){
		Text = text;
		TextUI.text = Text;
	}

	protected void FixedUpdate(){
		Vector3 tp = transform.position;
		Vector3 Targ = Target.position;
		var toTarget = tp - Targ;
//		var toTarget = transform.position - Target.position;
		toTarget.y = 0;
		transform.rotation = Quaternion.LookRotation(toTarget, Vector3.up);
	}
}
