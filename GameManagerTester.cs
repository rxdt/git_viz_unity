using System;
using NUnit.Framework;

namespace AssemblyCSharp
{
	[TestFixture()]
	public class GameManagerTester
	{
		[Test()]
		public void TestJsonParse (){
			Node node = new GameManager.parseJSON();
			Assert.IsInstanceOf<Node>(node);
		}
	}
}

