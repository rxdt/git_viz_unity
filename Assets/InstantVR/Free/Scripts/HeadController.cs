/* Head Controller
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.0
 * date: January 11, 2014
 * 
 * - Oculus SDK v0.4.4 support
 */

using UnityEngine;
using System.Collections;

public class HeadController : Controller
{
	public ControllerOptions controllers;
	[System.Serializable]
	public class ControllerOptions {
		public bool rift = true;
		//public bool plusHydraLeft = false;
		//public bool plusHydraRight = false;
		public bool kinect = true;
		public bool stickRight = true;
		public bool stickLeft = false;
	}
	
	protected OVRCameraRig ovrCR;
	protected Transform centerEyeAnchor;
	protected HandController leftHandController, rightHandController;

	[HideInInspector]
	public bool activated = false;
	protected Camera headcam;
	
	public Vector3 neckOffset = new Vector3(0, -0.1f, -0.13f);
	
	protected virtual void Start() {
		base.Initialize ();
		
		ovrCR = ivr.transform.GetComponentInChildren<OVRCameraRig>();
		centerEyeAnchor = ovrCR.centerEyeAnchor;
		if (centerEyeAnchor == null)
			Debug.LogWarning("centerEyeAnchor not found in OVR Camera Rift. Head animation will not work.");
		headcam = transform.FindChild("Headcam").GetComponentInChildren<Camera>();
		
		ovrCR.transform.position = headcam.transform.position;
		
		if (ovrCR != null) {
			if (ivr.riftPresent && controllers.rift == true) {
				ovrCR.gameObject.SetActive(true);
			} else {
				ovrCR.gameObject.SetActive(false);
			}
		}
		
		if (headcam != null) {
			if (ivr.riftPresent && controllers.rift == true) {
				headcam.gameObject.SetActive(false);
			} else {
				headcam.gameObject.SetActive(true);
			}
		}
		
		leftHandController = ivr.leftHandTarget.GetComponent<HandController>();
		rightHandController = ivr.rightHandTarget.GetComponent<HandController>();
		
		neckOffset = -headcam.transform.localPosition;
	}
	
	public virtual void UpdateHead() {
		if (ivr.riftPresent && controllers.rift == true)
			UpdateRift();
		else
			UpdateTraditional();
	}
	
	public override void OnTargetReset() {
		OVRManager.display.RecenterPose();
		Vector3 delta = transform.localPosition - StartPosition;
		delta = transform.parent.localRotation * delta;
		ovrCR.transform.Translate(-delta);
		if (ivr.riftPresent && controllers.rift == true)
			transform.localPosition = StartPosition;

		base.TargetReset(false);
	}

	private void UpdateRift() {
		if (centerEyeAnchor) {
			Vector3 thisNeckOffset = headcam.transform.rotation * -neckOffset;
			thisNeckOffset = centerEyeAnchor.rotation * -neckOffset;
			Vector3 newPos = headcam.transform.position - thisNeckOffset;
			newPos = centerEyeAnchor.position - thisNeckOffset;
			Vector3 newLocalPos = transform.parent.InverseTransformPoint(newPos);
			
			UpdatePosition(newLocalPos);
		}
	}
	
	protected void UpdateTraditional() {
		if (controllers.stickRight) 
			transform.localEulerAngles = new Vector3(rightHandController.input.xAngle, rightHandController.input.yAngle, 0);
		else if (controllers.stickLeft)
			transform.localEulerAngles = new Vector3(leftHandController.input.xAngle, leftHandController.input.yAngle, 0);
	}
	
	
}