using System;
using UnityEngine;
using UnityEngine.UI;

public class GameBillboardText : MonoBehaviour
{
	public Transform Target;
	public String Text = "Filename";
	public Text TextUI;

	protected void Awake(){	
		SetText(Text);
	}

	public void SetText(string text){
		Text = text;
		TextUI.text = Text;
	}

	protected void FixedUpdate(){
		var toTarget = transform.position - Target.position;
		toTarget.y = 0;
		transform.rotation = Quaternion.LookRotation(toTarget, Vector3.up);
	}
}
