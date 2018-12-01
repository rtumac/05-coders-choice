defmodule Search.ShortestPath do

  def get_shortest_path(origin, destination, graph) do
    initialize_state(origin, destination, graph)
      |> recursive_backtrack
  end

  defp initialize_state(origin, destination, graph) do
    %{
      origin:        origin,
      destination:   destination,
      graph:         graph.adjacency_list,
      current_path:  [ origin ],
      shortest_path: []
    }
  end

  # exhausted all paths in the graph
  defp recursive_backtrack(%{ current_path: [] } = state) do
    state.shortest_path
  end

  # reached destination
  defp recursive_backtrack(%{ origin: x, destination: x } = state) do
    state =
      state |> visit_node(state.origin)

    if( length(state.current_path) <  length(state.shortest_path) ) do
      state
        |> Map.put(:shortest_path, state.current_path)
    end

    state
  end

  defp recursive_backtrack(state) do
    state =
      state |> visit_node(state.origin)

    { :ok, iterator } = Iterator.start(state.graph[ state.origin ])

    state
      |> iterate_list(iterator)


    # check if node is in current_path




    # recursive_backtrack(state)




    # update current_path / shortest_path accordingly


  end

  # iterate recursively over a list of nodes
  defp iterate_list(state, iterator) do
    next_node = iterator |> Iterator.next()

    if (next_node) do
      state
        |> Map.put(:origin, next_node)
        |> recursive_backtrack()
        |> iterate_list(iterator)
    end
  end

  defp visit_node(state, node) do
    state
      |> Map.put(:current_path, [ node | state.current_path ])
  end

end
