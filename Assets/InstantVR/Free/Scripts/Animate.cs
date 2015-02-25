/* Animate
 * author: Pascal Serrarens
 * email: support@passervr.com
 * version: 2.0.0
 * date: December 12, 2014
 * 
 * - Now uses float 0..1 for framepointer
 */

using UnityEngine;
using System.Collections;

public class Animate : MonoBehaviour {

	public float speed = 0;
	private bool idle = false;

	public bool startStep = false;//, followStep = false;

	public KeyFrame[] keyFrames = {
		new Animate.KeyFrame(0, 12, new Vector3(0,0,0), new Vector3(80,0,0), 60),
		new Animate.KeyFrame(12, 24, new Vector3(0,0.3f,0.5f), new Vector3(20,0,0), 60),
		new Animate.KeyFrame(24, 60, new Vector3(0,0,1f), new Vector3(-30,0,0), 60)
	};
	public Vector3 stepTarget;

	private int nrFrames = 60;
	private float frameSpeed = 60;

	public float f = 0;
	private int keyFrameNr1, keyFrameNr2;
	private float frameLen;

	private Vector3 basePos;

	public void Initialize () {
		basePos = transform.localPosition;

		f = 0;
		CalculateKeyFrameNrF(keyFrames, f, out keyFrameNr1, out keyFrameNr2);
	}

	public void StartStep(Vector3 origin, Vector3 target) {
		keyFrames = new KeyFrame[3];
		keyFrames[0] = new KeyFrame( 0,12,origin, Vector3.zero, 60);
		keyFrames[1] = new KeyFrame(12,24,new Vector3(origin.x/2 + target.x/2, target.y/2 + 0.3f, origin.z/2 + target.z/2), Vector3.zero, 60);
		keyFrames[2] = new KeyFrame(24,60,new Vector3(target.x, target.y, target.z), Vector3.zero, 60);
		if (!startStep) {
			startStep = true;
//			if (!followStep) {
				f = 0;
				CalculateKeyFrameNrF(keyFrames, f, out keyFrameNr1, out keyFrameNr2);
				speed = 1;
				frameLen = keyFrames[keyFrameNr1].toF - keyFrames[keyFrameNr1].fromF;

//			}
		}
		stepTarget = target;

		AnimationStepF();
	}

	void LateUpdate () {
		;//	AnimationStep();
	}

	void AnimationStepF() {
		if (speed == 0) {
			if (!idle) {
				transform.localPosition = Quaternion.AngleAxis(transform.localEulerAngles.y, Vector3.up) * basePos;
				
				f = 0;
				CalculateKeyFrameNrF(keyFrames, f, out keyFrameNr1, out keyFrameNr2);
				idle = true;
			}
		} else {
			idle = false;
			AnimateFrameF (transform, ref f, 
			              ref keyFrameNr1, ref keyFrameNr2, ref frameLen);
		}
	}

	void CalculateKeyFrameNrF(KeyFrame[] keyFrames, float f, out int keyFrameNr1, out int keyFrameNr2) {
		keyFrameNr1 = 0;
		keyFrameNr2 = 1;
		
		for (int i = 0; i < keyFrames.Length; i++) {
			if (f < keyFrames[i].toF && f >= keyFrames[i].fromF) {
				keyFrameNr1 = i;
				keyFrameNr2 = i + 1;
			}
		}
		if (keyFrameNr2 >= keyFrames.Length)
			keyFrameNr2 = 0;
	}
	
	void AnimateFrameF(Transform foot, ref float f,
	                  ref int keyFrameNr1, ref int keyFrameNr2, ref float frameLen) {

		if (speed < 0) {
			f -= ((Time.deltaTime * frameSpeed) / nrFrames);
			if (f < keyFrames[keyFrameNr1].fromF) {
				keyFrameNr2 = keyFrameNr1;
				keyFrameNr1--;
				if (keyFrameNr1 < 0) {
					keyFrameNr1 = keyFrames.Length - 1;
					f = 1;
				}
				frameLen = keyFrames[keyFrameNr1].toF - keyFrames[keyFrameNr1].fromF;
			}
		}
		
		if (speed != 0)
			CalculateFrameF(foot, keyFrames[keyFrameNr1], keyFrames[keyFrameNr2], frameLen, f);
		
		if (speed > 0) {
			f += ((Time.deltaTime * frameSpeed) / nrFrames);
			if (f > keyFrames[keyFrameNr1].toF) {
				keyFrameNr1 = keyFrameNr2;
				if (keyFrameNr1 == 0)
					f = 0;
				keyFrameNr2++;
				if (keyFrameNr2 >= keyFrames.Length) {
					keyFrameNr2 = 0;
					if (startStep == true) { // || followStep == true) {
						speed = 0;
						f = 0;
						idle = true;
						startStep = false;
						//followStep = false;
					}
				}
				frameLen = keyFrames[keyFrameNr1].toF - keyFrames[keyFrameNr1].fromF;
			}
		}
	}

	[System.Serializable]
	public class KeyFrame {
		public Vector3 position;
		public Vector3 euler;
		public float fromF;
		public float toF;

		public KeyFrame(int fromFrameNr_in, int toFrameNr_in, Vector3 position_in, Vector3 euler_in, float totalFrames) {
			position = position_in;
			euler = euler_in;
			fromF = fromFrameNr_in / totalFrames;
			toF = toFrameNr_in / totalFrames;
		}
	}

	private void CalculateFrameF(Transform transform,
	                            KeyFrame keyFrame1, KeyFrame keyFrame2, float frameLen, float globalF) {
		float localF = (globalF - keyFrame1.fromF) / frameLen;
		float absSpeed = Mathf.Abs(speed);

		Vector3 position1 = keyFrame1.position * absSpeed;
		Vector3 position2 = keyFrame2.position * absSpeed;
		Vector3 euler1 = keyFrame1.euler * absSpeed;
		Vector3 euler2 = keyFrame2.euler * absSpeed;
		
		float curY = transform.localEulerAngles.y;
		
		transform.localPosition = Vector3.Lerp(position1, position2, localF);
		Vector3 newLocalEulerAngles = Vector3.Lerp(euler1, euler2, localF);
		transform.localEulerAngles = new Vector3(newLocalEulerAngles.x, transform.localEulerAngles.y, newLocalEulerAngles.z);
		
		Quaternion q = Quaternion.AngleAxis(curY, Vector3.up);
		transform.localPosition = q * transform.localPosition;
	}
}
