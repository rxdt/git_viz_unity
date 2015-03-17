<h1>GitViz</h1>
A github commit log visualizer in 3D virtual reality (VR). When we think of 3D our minds may jump to gaming but there is unique and untapped potential in using VR to learn and understand complex systems. GitViz demonstrates this potential. 

Using the Oculus Rift headset and the Unity game engine, users can visualize any git commit log as a series of commits over time that change a repository's structure. A tree "grows" in front of a viewer as a repo changes. Since the structure is dynamic from commit to commit, the 3D vectors that determine node placement are continually recalculated as the tree shifts and adjusts to accomodate children.

<h3>What it represents</h3>
Each commit lasts about 5-10 seconds and can show deletions, additions, and/or modifications to files. 
Each node in the tree visualization represents either a file or directory and leaf nodes are files. New nodes "grow" out of directories when files are added. Nodes disappear when files are deleted. And sparkles/lightning zap a node momentarily when there is a modification to a file. 

<h3>Technology</h3>
<strong>Oculus Rift app:</strong> C# / Unity 4, JSON.Net library, assorted imported Assets 

<strong>Web app:</strong> Python / Flask, HTML, CSS

<h4>See the web app at:</h4> https://github.com/rxdt/git_viz_web.git



<br>Demo Visualization for a Ruby on Rails web app using multiple APIs:
<img src="https://cloud.githubusercontent.com/assets/6334979/6678281/f78f8d84-cbf5-11e4-9f8f-6e5f49b50a0e.png" height="13%">


A visualization of Gource, a different open-source 2D visualizer of commit logs:
<img src="https://cloud.githubusercontent.com/assets/6334979/6678295/1a13517e-cbf6-11e4-87e1-7dbbf866f6f3.png" height="13%">


<h3>Architecture</h3>

<img src="https://cloud.githubusercontent.com/assets/6334979/6699075/c8108c9a-ccbb-11e4-8909-f6530c8ea3bb.png">

<strong>GameManagerBehavior</strong>
The driver of the Oculus Rift application. Controls the pulling of data from the tree data structure. It traverses the tree structure and adds, deletes, and modifies nodes as needed. It adds text to nodes in the scene and in memory.

<strong>NodeUtility</strong>
Static class that controls placement of new nodes relative to siblings and parents, deletion of nodes, and getting existing nodes. Math calculations for placement done here.

<strong>NodeBehavior</strong>
Class that contains node attributes and helper methods to control the overall tree sway. Class is linked to NodePrefab objects in the scene.

<strong>Parser</strong>
Static class that reads JSON and converts it into a C# usable data structure.

<strong>parse_log.py</strong>
Parses a repository's commit log and puts it into JSON.

<strong>GameBillboardText</strong>
Sets a node's text in the scene from the filename. Ensures that the text is always facing the viewer so they can read it.

<strong>A simplified sample of a JSONified commit log</strong>
<pre>
<code>[
  {
    "A": [
      "git_viz.py",
      "parse_log.py",
      "templates/index.html"
    ]
  }, 
  {
    "A": [
      "README.md"
    ]
  }, 
  {
    "A": [
      "static/1.jpg", 
      "static/cubes.png", 
      "static/index.css", 
    ], 
    "M": [
      "git_viz.py", 
      "templates/index.html"
    ]
  }, 
  {
    "D": [
      "git_viz.py", 
      "templates/index.html", 
    ]
  }, 
  {
    "M": [
      "static/index.css", 
      "static/welcome.css", 
      "templates/welcome.html"
    ]
  }, 
  {
    "A": [
      "static/gource.png", 
      "static/ruby.png", 
      "static/this.png"
    ], 
    "M": [
      "templates/welcome.html"
    ]
  }
]</code>
</pre>



<strong>See the web app for more:</strong> https://github.com/rxdt/git_viz_web.git


<h3>Potential future iterations</h3>
<ul>
<li>Refactor to further optimize nodes and lines using particle systems.</li>
<li>Enable mass-size repo visualizations e.g. Linux kernel repository.</li>
<li>Integrate LeapMotion controller so a user can manipulate nodes or follow a node's path.</li>
</ul>

Learn about the developer at: www.linkedin.com/in/roxdt/en
