/* Controller
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.0
 * date: December 12, 2014
 * 
 * - Use get/set for BaseOrientation & StartOrientation
 * - Added RotateBaseAround
 */

using UnityEngine;
using System.Collections;

public class Controller : MonoBehaviour {

	protected InstantVR_Free ivr;
	public InstantVR_Free IVR {
		get {return ivr;}
		set {ivr = value;}
	}

	private Vector3 startPosition;
	public Vector3 StartPosition {
		get {return startPosition;}
		set {startPosition = value;}
	}

	private Vector3 basePosition = Vector3.zero;
	public Vector3 BasePosition {
		get {return basePosition;}
		set {basePosition = value;}
	}
	public void TranslateBasePosition(Vector3 delta) {
		basePosition -= delta;
		transform.localPosition += delta;
	}
	public void CorrectBasePosition(Vector3 delta) {
		Vector3 curPos = transform.localPosition + basePosition;
		basePosition -= delta;
		UpdatePosition(curPos);
	}

	private Quaternion startOrientation;
	public Quaternion StartOrientation {
		get {return startOrientation;}
		set {startOrientation = value;}
	}
	private Quaternion baseOrientation = Quaternion.identity;
	public Quaternion BaseOrientation {
		get {return baseOrientation;}
		set {baseOrientation = value;}
	}

	public void CorrectBaseOrientation(Quaternion delta) {
		Quaternion curOrientation = transform.localRotation * baseOrientation;
		baseOrientation *= Quaternion.Inverse(delta);
		UpdateOrientation(curOrientation);
	}

	public virtual void RotateBaseAround(Quaternion rotation, Vector3 origin) {
		baseOrientation *= Quaternion.Inverse(rotation);
	//	basePosition = Quaternion.Inverse(rotation) * basePosition;
	}


	protected bool tracking = false;

	public void Initialize() {
		startPosition = transform.localPosition;
		startOrientation = transform.localRotation;
	}

	public void TargetReset(bool resetOrientation) {
		if (resetOrientation) {
			baseOrientation = transform.localRotation * baseOrientation * Quaternion.Inverse(startOrientation);
			transform.localRotation = startOrientation;
		}
		Vector3 corrTargetPosition = transform.localPosition - baseOrientation * (startPosition);
		basePosition = corrTargetPosition + basePosition; // - startPosition;
		transform.localPosition = startPosition;
	}

	public virtual void OnTargetReset() {
		TargetReset(true);
	}


	public void UpdatePosition(Vector3 newPos) {
		Vector3 cNewPos = newPos; // baseOrientation * (newPos);
		transform.localPosition = Quaternion.Inverse(baseOrientation) * (cNewPos - basePosition);
	}

	public void Translate(Vector3 direction, Space space = Space.Self) {
		transform.Translate(direction, space);
	}

	public void UpdateOrientation(Quaternion orientation) {
		transform.localRotation =  Quaternion.Inverse(baseOrientation) * orientation; //  * Quaternion.Inverse(startOrientation);
	}
}
