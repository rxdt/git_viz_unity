/* Targets Controller
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.1
 * date: January 16, 2014
 * 
 * - Improved stability
 */

using UnityEngine;
using System.Collections;

public class TargetsController : MonoBehaviour {
	public InstantVR_Free ivr;
	private Vector3 hipDelta;
	
	private HeadController headController;
	private HipController hipController;
	private HandController leftHandController, rightHandController;
	
	private OVRCameraRig ovrCR;

	void Awake() {
		ovrCR = ivr.GetComponentInChildren<OVRCameraRig>();
	}

	void Start() {
		hipDelta = ivr.hipTarget.localPosition;
		
		headController = ivr.headTarget.GetComponent<HeadController>();
		leftHandController = ivr.leftHandTarget.GetComponent<HandController>();
		rightHandController = ivr.rightHandTarget.GetComponent<HandController>();
		hipController = ivr.hipTarget.GetComponent<HipController>();
	}
	
	public void UpdateTargets() {
		headController.UpdateHead();
		hipController.UpdateHip();

		leftHandController.UpdateHand();
		rightHandController.UpdateHand();

		RaycastHit hit;
		Physics.Raycast(ivr.hipTarget.position, Vector3.down, out hit, Mathf.Infinity, ~((1 << 9) | (1 << 8)));
		Vector3 localHitPoint = ivr.hipTarget.InverseTransformPoint(hit.point);
		float deltaY = ivr.hipTarget.localPosition.y + localHitPoint.y;
		if (deltaY > 0.25f) deltaY = 0;
		
		Vector3 positionDelta = new Vector3(
			hipDelta.x - ivr.hipTarget.localPosition.x,
			0,
			hipDelta.z - ivr.hipTarget.localPosition.z
			);
		
		if (positionDelta.magnitude > 0 || deltaY != 0) {
			transform.Translate(-positionDelta + Vector3.up * deltaY, Space.Self);

			if (ovrCR != null)
				ovrCR.transform.Translate(Vector3.up * deltaY);

			if (positionDelta.magnitude > 0) {
				if (!(ivr.riftPresent && headController.controllers.rift))
					headController.TranslateBasePosition(positionDelta);
				
				leftHandController.TranslateBasePosition(positionDelta);
				rightHandController.TranslateBasePosition(positionDelta);
				
				hipController.TranslateBasePosition(positionDelta);

				ivr.leftFootTarget.Translate(positionDelta);
				ivr.rightFootTarget.Translate(positionDelta);
			}
		}
		
	}
}
