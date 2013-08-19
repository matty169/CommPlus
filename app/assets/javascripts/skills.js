function skills_reccommended(tag) {
//______________________________________________________________________
  //
  // Start with the setup
  // - Set the width and height and other variable.
  // - Create the SVG space
  //
  // Load the data
  // - This I will still have figure out.
  // - Im not sure how to pass from RAILS to Javascript.
  //
  //______________________________________________________________________
  // Set the dimension variables
  var width = 950,
    height = 700;
// define a color scale. I need to research more on the various color scales.
var color = d3.scale.category20();
// Set the radius scale.
var radius = d3.scale.sqrt()
    .range([0, 20]);
// Create the SVG canvas.
var svg = d3.select(tag).append("svg")
    .attr("width", width)
    .attr("height", height);
// Use the force layout.
var force = d3.layout.force()
    .size([width, height])
    .gravity(0.001)
    .charge(-1000)
    .linkDistance(120);
// Retrieve the data in json form
// Decompose the JSON and save the the force layout.
// Force seems like it requires nodes and links to work.
d3.json("/skills/tree.json", function(graph) {

  var nodes = flatten(graph),
      links = d3.layout.tree().links(nodes);

  force
      .nodes(nodes)
      .links(links)
      .on("tick", tick) // I think this is for the movement of the drawing. The simulation
      .start();   // Make the magic happen.
      // Create the links and associate the data.
  var link = svg.selectAll(".link")
      .data(links)
      .enter().append("g")
      .attr("class", "link");

      // Create a line to visually connect the nodes
  link.append("line");

      // I suspenct this is for the double bond

      // Create the nodes varaiables and associated to the data.
  var node = svg.selectAll(".node")
      .data(nodes)
      .enter().append("svg:a")
      .attr("class", "node")
      .attr("xlink:href", function(d) { return d.url || "#"; })
      .call(force.drag);
      // Create the cicles to visually form the nodes
  node.append("circle")
      .attr("r", function(d) { return radius(d.size) || 4.5; })
      .style("fill", function(d) { return color(d.name); });
      // Create the text to visually identify the nodes
  node.append("text")
      .attr("dy", ".35em")
      .attr("text-anchor", "middle")
      .text(function(d) { return d.name; })
      .style('font-size', function(d) { return (radius(d.size)*3) / d.name.length + 'px'; });

      // This makes stuff move.
  function tick() {

    nodes[(nodes.length-1)].x = width / 2;
    nodes[(nodes.length-1)].y = height / 2;

    link.selectAll("line")
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  }

  function flatten(root) {
  var nodes = [], i = 0;
 
  function recurse(node) {
    if (node.children) node.children.forEach(recurse);
    if (!node.id) node.id = ++i;
    nodes.push(node);
  }
 
  recurse(root);
  return nodes;
}

});
}