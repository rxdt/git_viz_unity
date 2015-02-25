/* Leg Movements
 * author: Pascal Serrarnes
 * email: unity@serrarens.nl
 * version: 2.3.0
 * date: October 15, 2014

Changes: 
 * - Leg orientation improved with high foot positions
 */

using UnityEngine;
using System.Collections;

public class LegMovements: MonoBehaviour {

	public Transform headTarget;
	private Transform rightHandDummyTarget, leftHandDummyTarget;
	public Transform rightFootTarget, leftFootTarget;

	private Quaternion fromNormNeck;
	
	public enum BodySide {
		Left,
		Right
	};
	
	public Transform targets;
	protected Transform characterTransform = null;
	protected Rigidbody characterRigidbody;
	
	private Transform neck;
	private Arm rightArmDummy;
	private Arm leftArmDummy;
	protected Leg rightLeg;
	protected Leg leftLeg;
	

	[HideInInspector]
	public bool forwardMovement = false;

	void Start() {
		characterTransform = this.transform;
		characterRigidbody = this.rigidbody;
		Animator animator = characterTransform.GetComponentInChildren<Animator>();

		neck = animator.GetBoneTransform(HumanBodyBones.Neck);
		fromNormNeck = Quaternion.Inverse(Quaternion.LookRotation(characterTransform.forward)) * neck.rotation;

		Transform upperArm, forearm, hand;
		
		upperArm = animator.GetBoneTransform(HumanBodyBones.RightUpperArm);
		forearm = animator.GetBoneTransform(HumanBodyBones.RightLowerArm);
		hand = animator.GetBoneTransform(HumanBodyBones.RightHand);
		rightArmDummy = new Arm(BodySide.Right, upperArm, forearm, hand, characterTransform);

		GameObject rightHandGO = new GameObject();
		rightHandGO.name = "Hand_R_Target";
		rightHandDummyTarget = rightHandGO.transform;
		rightHandDummyTarget.parent = targets.transform;
		rightHandDummyTarget.localPosition = new Vector3(0.24f, 0.8f, -0.1f);
		rightHandDummyTarget.localEulerAngles = new Vector3(80, 25, 300);
		rightArmDummy.StretchToTarget(rightHandDummyTarget);

		upperArm = animator.GetBoneTransform(HumanBodyBones.LeftUpperArm);
		forearm = animator.GetBoneTransform(HumanBodyBones.LeftLowerArm);
		hand = animator.GetBoneTransform(HumanBodyBones.LeftHand);
		leftArmDummy = new Arm(BodySide.Left, upperArm, forearm, hand, characterTransform);

		GameObject leftHandGO = new GameObject();
		leftHandGO.name = "Hand_L_Target";
		leftHandDummyTarget = leftHandGO.transform;
		leftHandDummyTarget.parent = targets.transform;
		leftHandDummyTarget.localPosition = new Vector3(-0.24f, 0.8f, -0.1f);
		leftHandDummyTarget.localEulerAngles = new Vector3(80, 25, 120);
		leftArmDummy.StretchToTarget(leftHandDummyTarget);

		Transform upperLeg, lowerLeg, foot;
		
		upperLeg = animator.GetBoneTransform(HumanBodyBones.RightUpperLeg);
		lowerLeg = animator.GetBoneTransform(HumanBodyBones.RightLowerLeg);
		foot = animator.GetBoneTransform(HumanBodyBones.RightFoot);
		rightLeg = new Leg(upperLeg, lowerLeg, foot, characterTransform);
		
		upperLeg = animator.GetBoneTransform(HumanBodyBones.LeftUpperLeg);
		lowerLeg = animator.GetBoneTransform(HumanBodyBones.LeftLowerLeg);
		foot = animator.GetBoneTransform(HumanBodyBones.LeftFoot);
		leftLeg = new Leg(upperLeg, lowerLeg, foot, characterTransform);
	}
	
	void LateUpdate () {
		rightLeg.Calculate(rightFootTarget.transform);
		leftLeg.Calculate(leftFootTarget.transform);

		characterRigidbody.MovePosition(targets.position);
		characterRigidbody.MoveRotation(targets.rotation);

		CalculateHeadOrientation(neck, headTarget);
	}
	/*
	void CalculateTargetPositions() {
		targets.transform.position = characterTransform.position;
	}
	*/
	void CalculateHeadOrientation(Transform neck, Transform neckTarget) {
		neck.rotation = neckTarget.rotation * fromNormNeck;
	}
	/*
	private float AngleDifference(float a, float b) {
		float r = b - a;
		while (r < -180) r += 360;
		while (r > 180) r -= 360;
		return r;
	}
	*/
	public class Arm {
		public Transform upperArm;
		public Transform forearm;
		public Transform hand;
		
		protected Quaternion fromNormUpperArm;
		protected Quaternion fromNormForearm;
		protected Quaternion fromNormHand;
		
		public Arm(BodySide bodySide_in, Transform upperArm_in, Transform forearm_in, Transform hand_in, Transform characterTransform) {
			upperArm = upperArm_in;
			forearm = forearm_in;
			hand = hand_in;
			
			fromNormUpperArm = Quaternion.Inverse(Quaternion.LookRotation(forearm.position - upperArm.position)) * upperArm.rotation;
			fromNormForearm = Quaternion.Inverse(Quaternion.LookRotation(hand.position - forearm.position)) * forearm.rotation;
			fromNormHand = Quaternion.Inverse(Quaternion.LookRotation(hand.position - forearm.position)) * hand.rotation;
		}

		public void StretchToTarget(Transform handTarget) {
			upperArm.LookAt(handTarget.position, handTarget.up);
			upperArm.rotation *= fromNormUpperArm;
			forearm.LookAt(handTarget.position, handTarget.up);
			forearm.rotation *= fromNormForearm;
			
			hand.rotation = handTarget.rotation * fromNormHand;
		}
	}

	public class Leg {
		private Transform characterTransform;
		public Transform upperLeg;
		public Transform lowerLeg;
		public Transform foot;
		
		private Quaternion fromNormUpperLeg;
		private Quaternion fromNormLowerLeg;
		private Quaternion fromNormFoot;
		
		private float upperLegLength, lowerLegLength;
		private float upperLegLength2, lowerLegLength2;
		
		public Leg(Transform upperLeg_in, Transform lowerLeg_in, Transform foot_in, Transform characterTransform_in) {
			characterTransform = characterTransform_in;
			
			upperLeg = upperLeg_in;
			lowerLeg = lowerLeg_in;
			foot = foot_in;
			
			fromNormUpperLeg = Quaternion.Inverse(Quaternion.LookRotation (foot.position - upperLeg.position, characterTransform.forward)) * upperLeg.rotation;
			fromNormLowerLeg = Quaternion.Inverse(Quaternion.LookRotation(foot.position - lowerLeg.position, characterTransform.forward)) * lowerLeg.rotation;
			fromNormFoot = Quaternion.Inverse(Quaternion.LookRotation (characterTransform.forward)) * foot.rotation;
			
			upperLegLength = Vector3.Distance(upperLeg.position, lowerLeg.position);
			lowerLegLength = Vector3.Distance(lowerLeg.position, foot.position);
			
			upperLegLength2 = upperLegLength * upperLegLength;
			lowerLegLength2 = lowerLegLength * lowerLegLength;
			
		}
		
		public void Calculate(Transform footTarget) {
			float dHipTarget = Vector3.Distance (upperLeg.position, footTarget.position);
			float hipAngle = Mathf.Acos((dHipTarget * dHipTarget + upperLegLength2 - lowerLegLength2)/ (2 * upperLegLength * dHipTarget)) * Mathf.Rad2Deg;
			if (float.IsNaN(hipAngle)) hipAngle = 0;
			
			upperLeg.LookAt (footTarget.position, footTarget.forward);
			upperLeg.rotation = Quaternion.AngleAxis(-hipAngle, upperLeg.right) * upperLeg.rotation;
			upperLeg.rotation *= fromNormUpperLeg;
			
			lowerLeg.LookAt (footTarget.position, footTarget.forward);
			lowerLeg.rotation *= fromNormLowerLeg;
			
			foot.rotation = footTarget.rotation * fromNormFoot;
		}
	}
}