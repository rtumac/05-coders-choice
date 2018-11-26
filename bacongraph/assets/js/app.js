// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

import vis from 'vis'

(function () {
  // provide data in the DOT language
  var DOTstring = 'dinetwork {Malkovich -- Hoffman -- Bacon; \
    Foster -- Hoffman -- Pollak -- Bacon \
    Wilson -- Giallini -- Molinari -- Welker -- Bacon \
    Bacon -- Stone -- Wilson -- Jaoui}';


  var parsedData = vis.network.convertDot(DOTstring);

  var data = {
    nodes: parsedData.nodes,
    edges: parsedData.edges
  }

  var options = parsedData.options;

  // you can extend the options like a normal JSON variable:
  options.nodes = {
    color: 'red'
  }

  // create a network
  var network = new vis.Network(container, data, options);

}());

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"
