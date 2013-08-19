function skills(tag, url) {

	var width = 400,
    height = 400;
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
    .charge(-500);
// Retrieve the data in json form
// Decompose the JSON and save the the force layout.
// Force seems like it requires nodes and links to work.
d3.json(url, function(graph) {
  force
      .nodes(graph.nodes)
      .on("tick", tick) // I think this is for the movement of the drawing. The simulation
      .start();   // Make the magic happen.

      // Create the nodes varaiables and associated to the data.
  var node = svg.selectAll(".node")
      .data(graph.nodes)
      .enter().append("svg:a")
      .attr("class", "node")
      .attr("xlink:href", function(d) { return d.url })
      .call(force.drag);
      // Create the cicles to visually form the nodes
  node.append("circle")
      .attr("r", function(d) { return radius(d.size); })
      .style("fill", function(d) { return color(d.skill); });
      // Create the text to visually identify the nodes
  node.append("text")
      .attr("dy", ".35em")
      .attr("text-anchor", "middle")
      .text(function(d) { return d.skill; })
      .style('font-size', function(d) { return (radius(d.size)*2) / d.skill.length + 'px'; });

      // This makes stuff move.
  function tick() {
    node.attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"; });
  }
});
}