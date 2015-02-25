/* InstantVR Free
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.1
 * date: January 16, 2014
 * 
 * - added switch and rate for proximity speed
 * - fixed proximity walking speed too slow
 * - small performance improvement lookrotation
 */

using UnityEngine;
using System.Collections;

public class InstantVR_Free : MonoBehaviour {

	protected Transform targets;
	public Transform headTarget;
	public Transform leftHandTarget;
	public Transform rightHandTarget;
	public Transform hipTarget;
	public Transform leftFootTarget;
	public Transform rightFootTarget;

	protected TargetsController targetsController;
	protected HeadController headController;
	protected HandController leftHandController, rightHandController;
	protected HipController hipController;

	protected OVRCameraRig ovrCR;

	[HideInInspector]
	public Transform characterTransform;

	protected CapsuleCollider bodyCapsule;
	
	public bool walking = true;
	public bool sidestepping = true;
	public bool enableProximitySpeed = true;
	public float proximitySpeedRate = 0.8f;

	public enum RotationMethods { 
		NoRotation,
		ControllerInput,
		LookRotation,
		HandOrientation // This is advanced only
	};
	public RotationMethods bodyRotation = RotationMethods.LookRotation;
	public virtual RotationMethods BodyRotation {
		get { return bodyRotation; }
		set {
			if (value == RotationMethods.HandOrientation)
				bodyRotation = RotationMethods.LookRotation;
			else
				bodyRotation = value;
		}
	}
	public float maxRotationSpeed = 60;

	[HideInInspector]
	public bool hit = false;
	[HideInInspector]
	public Vector3 hitNormal = Vector3.zero;

	[HideInInspector]
	public bool riftPresent = false;
	[HideInInspector]
	public bool joystick2Present = false;
	[HideInInspector]
	public bool hydraPresent = false;
	[HideInInspector]
	public bool kinectPresent = false;

	protected virtual void Awake() {
		riftPresent = CheckRiftPresent();
		joystick2Present = CheckJoystick2Present();

		targets = headTarget.parent;

		Animator[] animators = GetComponentsInChildren<Animator>();
		for (int i = 0; i < animators.Length; i++) {
			Avatar avatar = animators[i].avatar;
			if (avatar.isValid && avatar.isHuman) {
				GameObject characterGO = animators[i].gameObject;
				characterTransform = characterGO.transform;
				
				AddLegMovements(characterGO);
				AddRigidbody(characterGO);

				targetsController = targets.GetComponent<TargetsController>();

				headController = headTarget.GetComponent<HeadController>();
				headController.IVR = this;

				rightHandController = rightHandTarget.GetComponent<HandController>();
				rightHandController.IVR = this;

				leftHandController = leftHandTarget.GetComponent<HandController>();
				leftHandController.IVR = this;

				hipController = hipTarget.GetComponent<HipController>();
				hipController.IVR = this;
				AddHipCollider(hipTarget.gameObject);
				bodyCapsule = hipTarget.GetComponent<CapsuleCollider>();

				ovrCR = GetComponentInChildren<OVRCameraRig>();
			}
		}
	}

	protected virtual void Update () {
		CheckRotation();
		if (walking)
			CheckMovement();
		
		CheckQuit();

		targetsController.UpdateTargets();
	}

	protected virtual void CheckRotation() {
		if (bodyRotation == RotationMethods.LookRotation) {
			CalculateLookOrientation();

		} else if (bodyRotation == RotationMethods.ControllerInput) {
			CalculateControllerOrientation();

		}
	}

	protected virtual void CalculateLookOrientation() {
		if (directionVector.magnitude != 0) {
			float lookDirection = headTarget.eulerAngles.y;
			float bodyDirection = targets.eulerAngles.y;
			float rotationAngle = AngleDifference(bodyDirection, lookDirection) * (maxRotationSpeed / 60 * Time.deltaTime);
			if (rotationAngle != 0) {
				Quaternion orientationDelta = Quaternion.AngleAxis(rotationAngle, Vector3.up);
				targets.rotation *= orientationDelta;
			}
		}
	}

	protected virtual void CalculateControllerOrientation() {
		float yRotation = leftHandController.input.yAngle;

		if (yRotation != 0) {
			float rotationAngle = (yRotation / 90) * (maxRotationSpeed * Time.deltaTime);
			Quaternion orientationDelta = Quaternion.AngleAxis(rotationAngle, Vector3.up);
			targets.rotation *= orientationDelta;
			ovrCR.transform.RotateAround(targets.position, Vector3.up, rotationAngle);
		}
	}

	protected Vector3 directionVector = Vector3.zero;
	[HideInInspector]
	public Vector3 inputDirection;
	protected float proximitySpeed = 1;
	
	public virtual void CheckMovement() {
		float maxAcceleration = 0;
		float sidewardSpeed = 0;
		
		float horizontal = 0;
		float vertical = leftHandController.input.stickVertical;
		float forwardSpeed = Mathf.Min(1.0f, Mathf.Abs(vertical));

		if (enableProximitySpeed)
			proximitySpeed = CalculateProximitySpeed(bodyCapsule, proximitySpeed);

		if (forwardSpeed != 0 || directionVector.z != 0) {
			forwardSpeed = forwardSpeed * forwardSpeed;
			forwardSpeed *= Mathf.Sign(vertical);
			if (vertical < 0)
				forwardSpeed *= 0.6f;

			if (enableProximitySpeed)
				forwardSpeed *= proximitySpeed;

			float acceleration = forwardSpeed - directionVector.z;
			maxAcceleration = 1f * Time.deltaTime;
			acceleration = Mathf.Clamp(acceleration, -maxAcceleration, maxAcceleration);
			forwardSpeed = directionVector.z + acceleration;
		}
		
		Vector3 newdirectionVector;
		if (sidestepping) {
			horizontal = leftHandController.input.stickHorizontal;
			sidewardSpeed = Mathf.Min(1.0f, Mathf.Abs(horizontal));
			
			if (sidewardSpeed != 0 || directionVector.x != 0) {
				sidewardSpeed = sidewardSpeed * sidewardSpeed;
				sidewardSpeed *= Mathf.Sign(horizontal) * 0.5f;

				if (enableProximitySpeed)
					sidewardSpeed *= proximitySpeed;

				float acceleration = sidewardSpeed - directionVector.x;
				maxAcceleration = 1f * Time.deltaTime;
				acceleration = Mathf.Clamp(acceleration, -maxAcceleration, maxAcceleration);
				sidewardSpeed = directionVector.x + acceleration;
			}
		}
		newdirectionVector = new Vector3(sidewardSpeed, 0, forwardSpeed);
		inputDirection = targets.TransformDirection(new Vector3(horizontal, 0, vertical));

		if (proximitySpeed <= 0.15f) {
			Vector3 worldDirectionVector = targets.TransformDirection(newdirectionVector);
			float angle = Vector3.Angle(worldDirectionVector, hitNormal);
			if (angle > 90.1)
				newdirectionVector = Vector3.zero;
		}

		if (newdirectionVector.magnitude > 0) {
			Vector3 translation = newdirectionVector * Time.deltaTime;
			
			Vector3 rotTranslation = targets.localRotation * translation;
			if (riftPresent && headController.controllers.rift == true) {
				if (BodyRotation == RotationMethods.ControllerInput )
					ovrCR.transform.Translate(translation, Space.Self);
				else
					ovrCR.transform.Translate(rotTranslation, Space.Self);
			} else {
				headController.TranslateBasePosition(translation);
			}

			hipController.TranslateBasePosition(translation);
			leftHandController.TranslateBasePosition(translation);
			rightHandController.TranslateBasePosition(translation);
		}
		directionVector = newdirectionVector;
	}

	protected float CalculateProximitySpeed(CapsuleCollider cc, float proximitySpeed) {
		if (hit) {
			if (cc.radius > 0.25f) {
				if (Physics.CheckCapsule(hipTarget.position + (cc.radius - 1) * Vector3.up, hipTarget.position - (cc.radius - 1) * Vector3.up, cc.radius - 0.05f, ~LayerMask.GetMask("MyBody"))) {
					cc.radius -= 0.05f / proximitySpeedRate;
					cc.height += 0.05f / proximitySpeedRate;
					proximitySpeed = EaseIn(1, (-0.90f), 1 - cc.radius, 0.75f);
				}
			}
		} else if (proximitySpeed < 1) {
			if (!Physics.CheckCapsule(hipTarget.position + (cc.radius - 0.95f) * Vector3.up, hipTarget.position - (cc.radius - 0.95f) * Vector3.up, cc.radius, ~LayerMask.GetMask("MyBody"))) {
				cc.radius += 0.05f / proximitySpeedRate;
				cc.height -= 0.05f / proximitySpeedRate;
				proximitySpeed = EaseIn(1, (-0.90f) , 1 - cc.radius, 0.75f);
			}
		} 

		return proximitySpeed;
	}                            
	
	private static float EaseIn(float start, float distance, float elapsedTime, float duration) {
		// clamp elapsedTime so that it cannot be greater than duration
		elapsedTime = (elapsedTime > duration) ? 1.0f : elapsedTime / duration;
		//return distance * elapsedTime * elapsedTime + start;
		return distance * elapsedTime * elapsedTime * elapsedTime * elapsedTime + start;
	}

	protected void CheckQuit() {
		if (Input.GetKeyDown(KeyCode.Escape))
			Application.Quit();
	}

	protected float AngleDifference(float a, float b) {
		float r = b - a;
		return NormalizeAngle(r);
	}

	protected float NormalizeAngle(float a) {
		while (a < -180) a += 360;
		while (a > 180) a -= 360;
		return a;
	}

	protected void AddRigidbody(GameObject gameObject) {
		Rigidbody rb = gameObject.AddComponent<Rigidbody>();
		if (rb != null) {
			rb.mass = 75;
			rb.useGravity = false;
			rb.isKinematic = true;
		}
	}

	protected void AddHipCollider(GameObject hipGameObject) {
		Rigidbody rb = hipGameObject.AddComponent<Rigidbody>();
		if (rb != null) {
			rb.mass = 1;
			rb.useGravity = false;
			rb.isKinematic = true;
		}

		CapsuleCollider collider = hipGameObject.AddComponent<CapsuleCollider>();
		if (collider != null) {
			collider.isTrigger = true;
			collider.radius = 1f;
			collider.height = 0.90f;
			collider.center = new Vector3(-hipGameObject.transform.localPosition.x, 0, -hipGameObject.transform.localPosition.z);
		}
	}

	void AddLegMovements(GameObject gameObject) {
		LegMovements lm = gameObject.AddComponent<LegMovements>();
		
		lm.headTarget = headTarget;
		lm.rightFootTarget = rightFootTarget;
		lm.leftFootTarget = leftFootTarget;
		
		lm.targets = headTarget.parent;
	}

	protected bool CheckRiftPresent() {
		if (OVRManager.display != null)
			return (OVRManager.display.isPresent);
		else
			return false;
	}
	
	protected bool CheckJoystick2Present() {
		bool joy4available = IsAxisAvailable("Horizontal R");
		bool joy5available = IsAxisAvailable("Vertical R");
		return (joy4available && joy5available);
	}
	
	private bool IsAxisAvailable(string axisName)
	{
		try
		{
			Input.GetAxis(axisName);
			return true;
		}
		catch (UnityException)
		{
			return false;
		}
	}
}
