/* Hand Controller
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.1.0
 * date: December 28, 2014
 * 
 * - Added arm swing animation
 */

using UnityEngine;
using System.Collections;

public class HandController : Controller
{
	public enum BodySide {
		Left,
		Right
	};
	public BodySide bodySide;

	public InputButtons input;

	protected HandController otherHandController = null;
	protected Transform targets;
	
	protected bool triggerPresent = false;
	protected bool bumperPresent = false;
	protected bool abxyPresent = false;
	protected bool dpadPresent = false;
	protected bool stickButtonsPresent = false;
	protected bool homeBackPresent = false;

	[HideInInspector]
	public bool activated = false;

	[HideInInspector]
	public int sixenseControllerIndex = 0;

	protected virtual void Start() 
	{
		base.Initialize();
		targets = ivr.headTarget.parent;
		if (bodySide == BodySide.Left)
			otherHandController = ivr.rightHandTarget.GetComponent<HandController>();
		else
			otherHandController = ivr.leftHandTarget.GetComponent<HandController>();

		input = new InputButtons();

		triggerPresent = CheckTriggerPresent();
		bumperPresent = CheckBumperPresent();
		abxyPresent = CheckABXYPresent();
		dpadPresent = CheckDPadPresent();
		stickButtonsPresent = CheckStickButtonsPresent();
		homeBackPresent = CheckHomeBackPresent();
	}

	public virtual void UpdateHand() {
		UpdateFingers();
		ArmSwingAnimation();
	}

	protected virtual void UpdateFingers()
	{
		input.stickHorizontal = 0;
		input.stickVertical = 0;
		input.stickButton = false;
		input.buttonOne = false;
		input.buttonTwo = false;
		input.buttonThree = false;
		input.buttonFour = false;
		input.bumper = false;
		input.trigger = 0;
		input.option = false;
		input.xAngle = calculateStickXAngle();
		input.yAngle = calculateStickYAngle();

		if (bodySide == BodySide.Right) {
			input.bumper |= Input.GetButton("Fire1");
			if (bumperPresent)
				input.bumper |= Input.GetButton("Bumper R");

							if (triggerPresent)
				input.trigger = Mathf.Min (1,
				                           input.trigger +
				                           (Input.GetButton("Fire2") ? 1 : 0) +
				                           Input.GetAxis("Trigger R"));
			else
				input.trigger = Mathf.Min (1,
				                           input.trigger +
				                           (Input.GetButton("Fire2") ? 1 : 0));
		
			if (ivr.joystick2Present) {
				input.stickHorizontal += Input.GetAxis("Horizontal R");
				input.stickVertical += Input.GetAxis("Vertical R");
			}

			if (stickButtonsPresent)
				input.stickButton |= Input.GetButton("Stick Button R");

			input.buttonOne |= Input.GetButton("Fire1");
			input.buttonTwo |= Input.GetButton("Fire2");
			if (abxyPresent) {
				input.buttonOne |= Input.GetButton("A Button");
				input.buttonTwo |= Input.GetButton("B Button");
				input.buttonThree |= Input.GetButton("X Button");
				input.buttonFour |= Input.GetButton("Y Button");
			}

			if (homeBackPresent)
				input.option |= Input.GetButton("Home");
		} else {
			if (bumperPresent)
				input.bumper |= Input.GetButton("Bumper L");

			if (triggerPresent)
				input.trigger = Mathf.Min (1,
				                           input.trigger +
				                           Input.GetAxis("Trigger L"));

			input.stickHorizontal += Input.GetAxis("Horizontal");
			input.stickVertical += Input.GetAxis("Vertical");

			if (stickButtonsPresent)
				input.stickButton |= Input.GetButton("Stick Button L");

			if (dpadPresent) {
				input.buttonOne |= (Input.GetAxis("Horizontal DPad") < -0.5f);
				input.buttonTwo |= (Input.GetAxis("Vertical DPad") < -0.5f);
				input.buttonThree |= (Input.GetAxis("Vertical DPad") > 0.5f);
				input.buttonFour |= (Input.GetAxis("Horizontal DPad") > 0.5f);
			}

			if (homeBackPresent)
				input.option |= Input.GetButton("Back");
		}

		if ((input.option && otherHandController != null && otherHandController.input.option) || 
		    (Input.GetKey(KeyCode.Tab))) {
				
			foreach (Transform t in targets) {
				t.gameObject.SendMessage("OnTargetReset", SendMessageOptions.DontRequireReceiver);
			}
		}
	}

	protected float xAngle = 0;
	protected float yAngle = 0;
	protected float lastJoy4, lastJoy5 = 0;

	protected static float maxXangle = 60;
	protected static float sensitivityX = 5;

	protected virtual float calculateStickXAngle() {
		float joy5 = 0;
		
		if (bodySide == BodySide.Left)
			joy5 -= Input.GetAxis("Vertical");
		else {
			if (ivr.joystick2Present)
				joy5 -= Input.GetAxis("Vertical R");
		}
		
		if (joy5 != 0) {
			xAngle = joy5 * maxXangle;
			lastJoy5 = joy5;
		} else if (lastJoy5 != 0) {
			xAngle = 0;
			lastJoy5 = 0;
		}
		
		if (bodySide == BodySide.Right)
			xAngle -= Input.GetAxis("Mouse Y") * sensitivityX;
		
		xAngle = Mathf.Clamp (xAngle, -maxXangle, maxXangle);
		
		return xAngle;
	}

	protected static float maxYangle = 70;
	protected static float sensitivityY = 5;
	
	protected virtual float calculateStickYAngle() {
		float joy4 = 0;
		
		if (bodySide == BodySide.Left)
			joy4 = Input.GetAxis("Horizontal");
		else {
			if (ivr.joystick2Present)
				joy4 = Input.GetAxis("Horizontal R");
		}
		
		if (joy4 != 0) {
			yAngle = joy4 * maxYangle;
			lastJoy4 = joy4;
		} else if (lastJoy4 != 0) {
			yAngle = 0;
			lastJoy4 = 0;
		}

		float correctedYAngle = yAngle;
		if (bodySide == BodySide.Right) {
			yAngle += Input.GetAxis("Mouse X") * sensitivityY;
			correctedYAngle = yAngle;
			
			if (joy4 == 0 && yAngle != 0 && ivr.characterTransform.localEulerAngles.y != 0) {
				correctedYAngle = correctedYAngle - ivr.characterTransform.localEulerAngles.y;
				
				if (correctedYAngle > 180)
					correctedYAngle -= 360;
				if (correctedYAngle < -180)
					correctedYAngle += 360;
			}
			correctedYAngle = Mathf.Clamp (correctedYAngle, -maxYangle, maxYangle);
			
		}
		
		return correctedYAngle;
	}
	
	protected bool CheckTriggerPresent() {
		bool triggerRavailable = IsAxisAvailable("Trigger R");
		bool triggerLavailable = IsAxisAvailable("Trigger L");
		return (triggerRavailable && triggerLavailable);
	}

	protected bool CheckBumperPresent() {
		bool bumperRavailable = IsButtonAvailable("Bumper R");
		bool bumperLavailable = IsButtonAvailable("Bumper L");
		return (bumperRavailable && bumperLavailable);
	}

	protected bool CheckABXYPresent() {
		bool aAvailable = IsButtonAvailable("A Button");
		bool bAvailable = IsButtonAvailable("B Button");
		bool xAvailable = IsButtonAvailable("X Button");
		bool yAvailable = IsButtonAvailable("Y Button");
		return (aAvailable && bAvailable && xAvailable && yAvailable);
	}
	
	protected bool CheckDPadPresent() {
		bool dPadXavailable = IsAxisAvailable("Horizontal DPad");
		bool dPadYavailable = IsAxisAvailable("Vertical DPad");
		return (dPadXavailable && dPadYavailable);
	}

	protected bool CheckStickButtonsPresent() {
		bool stickButtonLavailable = IsButtonAvailable("Stick Button L");
		bool stickButtonRavailable = IsButtonAvailable("Stick Button R");
		return (stickButtonRavailable && stickButtonLavailable);
	}

	protected bool CheckHomeBackPresent() {
		bool homeAvailable = IsButtonAvailable("Home");
		bool backAvailable = IsButtonAvailable("Back");
		return (homeAvailable && backAvailable);
	}

	bool IsAxisAvailable(string axisName)
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

	bool IsButtonAvailable(string buttonName)
	{
		try
		{
			Input.GetButton(buttonName);
			return true;
		}
		catch (UnityException)
		{
			return false;
		}
	}

	[System.Serializable]
	public class InputButtons {
		public float stickHorizontal;
		public float stickVertical;
		public float xAngle;
		public float yAngle;
		public bool stickButton;
		public bool buttonOne;
		public bool buttonTwo;
		public bool buttonThree;
		public bool buttonFour;
		public bool bumper;
		public float trigger;
		public bool option;
	}

	private Vector3 lastPosition;

	protected void ArmSwingAnimation() {
		Vector3 curSpeed = targets.InverseTransformDirection(ivr.hipTarget.position - lastPosition);
		curSpeed = new Vector3(curSpeed.x, 0, curSpeed.z);
		lastPosition = ivr.hipTarget.position;

		if (curSpeed.z < 0.01f || curSpeed.z > 0.01f) {
			if (bodySide == BodySide.Left) {
				this.transform.localPosition = new Vector3(transform.localPosition.x, 0.97f + (ivr.rightFootTarget.localPosition.z) / 2, ivr.rightFootTarget.localPosition.z);
				this.transform.localRotation = StartOrientation * Quaternion.AngleAxis((ivr.rightFootTarget.localPosition.z * 160 + 10), Vector3.up);
			} else {

				this.transform.localPosition = new Vector3(transform.localPosition.x, 0.97f + (ivr.leftFootTarget.localPosition.z) / 2, ivr.leftFootTarget.localPosition.z);
				this.transform.localRotation = StartOrientation * Quaternion.AngleAxis( - (ivr.leftFootTarget.localPosition.z * 160 + 10), Vector3.up);
			}
		}
	}
}