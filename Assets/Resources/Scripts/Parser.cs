using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public static class Parser {
	private static Dictionary<char, List<string>> commit;

	static void Start(){
		createDummyCommitsList();
		createTree();
	}

	public static void createTree(){

	}

	public static void createDummyCommitsList(){
		commit = new Dictionary<char, List<string>>();
		List<string> list = new List<string>();
		list.Add("file_one");
		list.Add("file_two");
		list.Add("file_three");
		commit['A'] = list;

		Debug.Log("\t\t\tHELLO\t\t!!!!!!!");
	}
}






