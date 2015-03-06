using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;


// parses commits_json_log into a dictionary of dictionaries that is stored in a JSON object
public static class Parser {
	public static List<Dictionary<string, List<string>>> parseCommitLog(string fileName){
		try{
			StreamReader theReader = new StreamReader("/Users/rxdt/commits_json.txt", Encoding.Default);
			string json = theReader.ReadToEnd();
			
			using(theReader){
				if(json != null){
					JSONObject commitsJson = new JSONObject(json); // creates a dictionary of dictionaries
					accessData(commitsJson);
					Debug.Log (commitsJson.Print());
					List<Dictionary<string, List<string>>> commits = JsonConvert.DeserializeObject< List<Dictionary<string, List<string>>> >(json);
					theReader.Close ();
					return commits;
				}
			}
		}
		catch (Exception e){
			Debug.Log("The file could not be read: ");
			Debug.Log(e.Message);
		}
		return null;
	}

	static void accessData(JSONObject obj){
		switch(obj.type){
		case JSONObject.Type.OBJECT:
			for(int i = 0; i < obj.list.Count; i++){
				string key = (string)obj.keys[i];
				JSONObject j = (JSONObject)obj.list[i];
				accessData(j);
			}
			break;
		case JSONObject.Type.ARRAY:
			foreach(JSONObject j in obj.list){
				accessData(j);
			}
			break;
		case JSONObject.Type.STRING:
			break;
		case JSONObject.Type.NUMBER:
			break;
		case JSONObject.Type.BOOL:
			break;
		case JSONObject.Type.NULL:
			break;
			
		}
	}
}


public class Commits{
	public Commit commit { get; set; }
}

public class Commit{
	public string specificfileAction;
	public List<string> files;
}





