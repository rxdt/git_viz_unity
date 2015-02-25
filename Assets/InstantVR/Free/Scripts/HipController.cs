/* Hip Controller
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.1
 * date: January 16, 2014
 * 
 * - Fixed blocking physical walking
 */

using UnityEngine;
using System.Collections;

public class HipController : Controller {
	
	[HideInInspector]
	public bool activated = false;
	
	protected Transform targets;
	protected Transform headTarget;
	protected Transform hipTarget;
	
	protected HandController leftHandController, rightHandController;
	protected HipController hipController;

	protected Animate leftFootAnimation, rightFootAnimation;
	protected Vector3 startFootLposition, startFootRposition;
	protected Vector3 startHipPosition;
	protected Vector3 startHipFootR, startHipFootL;
	protected Vector3 startHip2Head;
	
	Vector3 stepStart = Vector3.zero;
	
	protected virtual void Start () {
		base.Initialize();
		
		headTarget = ivr.headTarget;
		hipTarget = ivr.hipTarget;
		targets = headTarget.parent;
		
		leftHandController = ivr.leftHandTarget.GetComponent<HandController>();
		rightHandController = ivr.rightHandTarget.GetComponent<HandController>();
		
		hipController = this;

		leftFootAnimation = ivr.leftFootTarget.gameObject.AddComponent<Animate>();
		rightFootAnimation = ivr.rightFootTarget.gameObject.AddComponent<Animate>();

		startFootLposition = ivr.leftFootTarget.localPosition;
		startFootRposition = ivr.rightFootTarget.localPosition;
		startHipPosition = hipTarget.localPosition;
		startHip2Head = headTarget.localPosition - hipTarget.localPosition;
		startHipFootR = ivr.rightFootTarget.localPosition - transform.localPosition;
		startHipFootL = ivr.leftFootTarget.localPosition - transform.localPosition;
	}
	
	public virtual void UpdateHip() {
		Vector3 hip2head = headTarget.localPosition - hipTarget.localPosition;
		Vector3 delta = hip2head - startHip2Head;
		float distance = hip2head.magnitude - startHip2Head.magnitude;
		if (ivr.walking && ivr.sidestepping) {
			if (distance > 0.01f || ivr.inputDirection.magnitude > 0) {
				float yMargin = startHipPosition.y - hipTarget.localPosition.y - 0.02f;
				delta = new Vector3(Mathf.Clamp(delta.x, -0.02f, 0.02f), Mathf.Min(yMargin, delta.y), Mathf.Clamp(delta.z, -0.02f, 0.02f));
				
				Vector3 deltaWorld = targets.TransformDirection(delta);
				ivr.inputDirection += new Vector3(deltaWorld.x, 0, deltaWorld.z);
				
				if (ivr.hit) {
					float angle = Vector3.Angle(deltaWorld, ivr.hitNormal);
					if (angle > 90.1)
						delta = Vector3.zero;
				}
				
				hipController.TranslateBasePosition(delta);
				Vector3 handDelta = new Vector3(delta.x, 0, delta.z);
				leftHandController.TranslateBasePosition(handDelta);
				rightHandController.TranslateBasePosition(handDelta);
			}
		}

		if (ivr.walking || ivr.sidestepping) {
			FeetAnimation();
		}
	}
	
	Vector3 curSpeed;
	Vector3 lastPosition = Vector3.zero;
	Vector3 parentStart, parentDelta;
	bool lastStepLeft = false, lastStepRight = false;
	
	protected void FeetAnimation() {
		curSpeed = targets.InverseTransformDirection(hipTarget.position - lastPosition);
		curSpeed = new Vector3(curSpeed.x, 0, curSpeed.z);

		lastPosition = hipTarget.position;
		
		parentDelta = -targets.InverseTransformPoint(parentStart);
		parentDelta = new Vector3(parentDelta.x, 0, parentDelta.z);

		/*
		// Tripping protection
		if (rightFootAnimation.startStep == true && ivr.leftFootTarget.localPosition.x > hipTarget.localPosition.x) {
			rightFootAnimation.f = 0.39f;
			lastStepRight = true;
		} else if (leftFootAnimation.startStep == true && ivr.rightFootTarget.localPosition.x < hipTarget.localPosition.x) {
			leftFootAnimation.f = 0.39f;
			lastStepLeft = true;
		}
		*/
		if (leftFootAnimation.startStep == true || (lastStepRight == true && rightFootAnimation.startStep == false)) {
			FootStepLeft(leftFootAnimation, hipTarget.localPosition, ivr.leftFootTarget.localPosition, true);
			
		} else if (rightFootAnimation.startStep == true || (lastStepLeft == true && leftFootAnimation.startStep == false)) {
			FootStepRight(rightFootAnimation, hipTarget.localPosition, ivr.rightFootTarget.localPosition, true);
			
		} else if (curSpeed.x > 0 || curSpeed.z != 0) {
			FootStepRight(rightFootAnimation, hipTarget.localPosition, ivr.rightFootTarget.localPosition, false);
			
		} else if (curSpeed.x < 0)
			FootStepLeft(leftFootAnimation, hipTarget.localPosition, ivr.leftFootTarget.localPosition, false);
		
		else {
			lastStepLeft = false;
			lastStepRight = false;
		}
	}
	
	protected void FootStepLeft(Animate leftFootAnimation, Vector3 hipTargetPosition, Vector3 leftFootTargetPosition, bool follow) {
		Vector3 stepTarget = Vector3.zero;
		
		if (leftFootAnimation.startStep && leftFootAnimation.f > 0) {
			stepTarget = new Vector3(hipTargetPosition.x + startHipFootL.x, startFootLposition.y, hipTargetPosition.z + startHipFootL.z);
			if ((lastStepLeft && curSpeed.x < 0) || curSpeed.z != 0) {
				Vector3 avgSpeed = parentDelta / leftFootAnimation.f;
				stepTarget += avgSpeed / 2;
			}
			
			leftFootAnimation.StartStep(stepStart - parentDelta, stepTarget);
		} else
			
		if (!leftFootAnimation.startStep) {
			if (hipTargetPosition.x < leftFootTargetPosition.x ||
			    hipTargetPosition.x > leftFootTargetPosition.x + 0.15f ||
			    hipTargetPosition.z > leftFootTargetPosition.z + 0.2f ||
			    hipTargetPosition.z < leftFootTargetPosition.z - 0.1f) {
				
				stepTarget = new Vector3(hipTargetPosition.x + startHipFootL.x, startFootLposition.y, hipTargetPosition.z + startHipFootL.z);
			}
			if (stepTarget.magnitude > 0) {
				parentStart = targets.InverseTransformPoint(targets.position);
				parentStart = targets.position;
				stepStart = leftFootTargetPosition;
				leftFootAnimation.StartStep(stepStart, stepTarget);
				if (follow == false)
					lastStepLeft = true;
				lastStepRight = false;
			}
		} else
			lastStepLeft = false;
	}
	
	protected void FootStepRight(Animate rightFootAnimation, Vector3 hipTargetPosition, Vector3 rightFootTargetPosition, bool follow) {
		Vector3 stepTarget = Vector3.zero;
		
		if (rightFootAnimation.startStep && rightFootAnimation.f > 0) {
			stepTarget = new Vector3(hipTargetPosition.x + startHipFootR.x, startFootRposition.y, hipTargetPosition.z + startHipFootR.z);
			if ((lastStepRight && curSpeed.x > 0) || curSpeed.z != 0) {
				Vector3 avgSpeed = parentDelta / rightFootAnimation.f;
				stepTarget += avgSpeed / 2;
			}
			
			rightFootAnimation.StartStep(stepStart - parentDelta, stepTarget);
		} else
			
		if (!rightFootAnimation.startStep) {
			if (hipTargetPosition.x > rightFootTargetPosition.x ||
			    hipTargetPosition.x < rightFootTargetPosition.x - 0.15f ||
			    hipTargetPosition.z > rightFootTargetPosition.z + 0.2f ||
			    hipTargetPosition.z < rightFootTargetPosition.z - 0.1f) {
				
				stepTarget = new Vector3(hipTargetPosition.x + startHipFootR.x, startFootRposition.y, hipTargetPosition.z + startHipFootR.z);
			}
			if (stepTarget.magnitude > 0) {
				rightFootAnimation.StartStep(rightFootTargetPosition, stepTarget);
				parentStart = targets.InverseTransformPoint(targets.position);
				parentStart = targets.position;
				stepStart = rightFootTargetPosition;
				if (!follow)
					lastStepRight = true;
				lastStepLeft = false;
			}
		}
	}
	
	[System.Serializable]
	public class ControllerOptions {
		public bool kinect = true;
	}
	
	void OnTriggerStay() {
	//	if (ivr.hit == false)
	//		OnTriggerEnter();
	}
	
	void OnTriggerEnter()
	{
		ivr.hit = false;
		Vector3 dir = ivr.inputDirection;
		Vector3 origin = transform.position - (dir.normalized * 0.1f);
		CapsuleCollider sc = hipTarget.GetComponent<CapsuleCollider>();
		RaycastHit[] hits = Physics.SphereCastAll(origin, sc.radius, dir, 0.35f,  ~LayerMask.GetMask("MyBody"));
		for (int i = 0; i < hits.Length && ivr.hit == false; i++) {
			if (hits[i].rigidbody == null) {
				ivr.hit = true;
				ivr.hitNormal = hits[i].normal;
			}
		}
	}
	
	void OnTriggerExit() {
		ivr.hit = false;
	}
	
	
}
