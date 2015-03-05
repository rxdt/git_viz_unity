using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public static class Parser {
	private static Dictionary<char, List<string>> commit, commit1;

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

		commit1 = new Dictionary<char, List<string>>();
		List<string> list1 = new List<string>();
		list1.Add("file_one_two");
		list1.Add("file_two_two");
		list1.Add("file_three_two");
		commit['A'] = list;

		Debug.Log("\t\t\tHELLO\t\t!!!!!!!");
	}
}






