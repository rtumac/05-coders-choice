defmodule Search.ShortestPath do

  def get_shortest_path(origin, destination, graph) do
    initialize_state(origin, destination, graph)
      |> recursive_backtrack()
      |> Map.get(:shortest_path)
      |> Enum.reverse()
  end

  defp initialize_state(origin, destination, graph) do
    %{
      origin:        origin,
      destination:   destination,
      graph:         graph.adjacency_list,
      current_path:  []
    }
  end

  # reached destination
  defp recursive_backtrack(%{ origin: x, destination: x, shortest_path: _ } = state) do
    if( length(state.current_path) + 1 <  length(state.shortest_path) ) do
      state
        |> Map.put(:shortest_path, [state.origin | state.current_path])
        |> update_origin()
    else
      state
    end
  end

  defp recursive_backtrack(%{ origin: x, destination: x } = state) do
    state
      |> Map.put(:shortest_path, [state.origin | state.current_path])
      |> update_origin()
  end

  defp recursive_backtrack(state) do
    if(state |> visited?) do
      state
    else
      { :ok, iterator } = Iterator.start(state.graph[ state.origin ])

      state
        |> visit_node(state.origin)
        |> iterate_list(iterator)
        |> update_current_path()
        |> update_origin()
    end
  end

  # iterate recursively over a list of nodes
  defp iterate_list(state, iterator) do
    next_node = iterator |> Iterator.next()

    state
      |> handle_next(iterator, next_node)
  end

  defp handle_next(state, _iterator, nil) do
    state
  end

  defp handle_next(state, iterator, next_node) do
    state
      |> Map.put(:origin, next_node)
      |> recursive_backtrack()
      |> iterate_list(iterator)
  end

  defp visit_node(state, node) do
    state
      |> Map.put(:current_path, [ node | state.current_path ])
  end

  defp visited?(state) do
    state.current_path |>
      Enum.find_value(&(&1 == state.origin))
  end

  defp update_current_path(state) do
    { _, new_current_path } = state.current_path |> List.pop_at(0)

    state
      |> Map.put(:current_path, new_current_path)
  end

  defp update_origin(state) do
    state
      |> Map.put(:origin, state.current_path |> Enum.at(0))
  end

end
