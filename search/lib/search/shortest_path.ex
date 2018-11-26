defmodule Search.ShortestPath do

  def get_shortest_path(node_1, node_2, graph \\ GraphInit.new_graph) do
    recursive_backtrack(node_1, node_2, graph, [node_1], [])
  end

  # exhausted all paths in the graph
  defp recursive_backtrack(_, _, [], shortest_path) do
    shortest_path
  end

  # reached destination
  defp recursive_backtrack(node_1 , node_1,  graph, current_path, shortest_path) do
    current_path = [ node_1 | current_path ]

    if( current_path |> length() < shortest_path |> length() )do
      current_path
    else
      shortest_path
    end
  end

  defp recursive_backtrack(node_1, node_2, graph, current_path, shortes_path) do
    current_path = [ node_1 | current_path ]


    # ask iterator for next node

    # check if node is equal to node_2

    # check if node is in current_path

    # update current_path / shortest_path accordingly

    recursive_backtrack(node_1, node_2, graph, current_path, shortes_path)
  end

end
