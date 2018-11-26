defmodule Search do

  defdelegate get_shortest_path(node_1, node_2, graph \\ GraphInit.new_graph), to: Search.ShortestPath

end
