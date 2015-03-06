using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;

// parses commits_json_log into a dictionary of dictionaries that is stored in a JSON object
public static class Parser {
	public static JSONObject parseCommitLog(string fileName){
		try{
			// open commit text file
			StreamReader theReader = new StreamReader("/Users/rxdt/commits_json.txt", Encoding.Default);
			string json = theReader.ReadToEnd();

			using(theReader){
				if(json != null){
//					Debug.Log ("****************************- - - - *********************************");
					JSONObject commits = new JSONObject(json); // creates a dictionary of dictionaries
//					Debug.Log ("********     Right before commits returned     *********");
					accessData(commits);
					return commits;
					Debug.Log (commits.Print());
//					Debug.Log ("****************************- - - - *********************************");
				}
				theReader.Close ();
			}
		}
		catch (Exception e){
			Debug.Log("The file could not be read: ");
			Debug.Log(e.Message);
		}
		return null;
	}

	//access data (and print it)
	static void accessData(JSONObject obj){
		switch(obj.type){
		case JSONObject.Type.OBJECT:
			for(int i = 0; i < obj.list.Count; i++){
				string key = (string)obj.keys[i];
				JSONObject j = (JSONObject)obj.list[i];
//				Debug.Log(key);
				accessData(j);
			}
			break;
		case JSONObject.Type.ARRAY:
			foreach(JSONObject j in obj.list){
				accessData(j);
			}
			break;
		case JSONObject.Type.STRING:
//			Debug.Log(obj.str);
			break;
		case JSONObject.Type.NUMBER:
//			Debug.Log(obj.n);
			break;
		case JSONObject.Type.BOOL:
//			Debug.Log(obj.b);
			break;
		case JSONObject.Type.NULL:
//			Debug.Log("NULL");
			break;
			
		}
	}
}






