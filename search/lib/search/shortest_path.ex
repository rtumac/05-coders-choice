defmodule Search.ShortestPath do

  def get_shortest_path(origin, destination, graph) do
    graph
      |> initialize_state(origin, destination)
      |> recursive_backtrack()
      |> format_result()
  end

  defp format_result(%{ shortest_length: 0 }) do
    []
  end

  defp format_result(state) do
    state
      |> Map.get(:shortest_path)
      |> List.insert_at(0, state.destination)
      |> Enum.reverse()
  end

  defp initialize_state(graph, origin, destination) do
    %{
      origin:          origin,
      destination:     destination,
      graph:           graph,
      current_path:    [],
      shortest_path:   [],
      shortest_length: 0
    }
  end

  # reached destination
  defp recursive_backtrack(%{ origin: x, destination: x, shortest_length: 0 } = state) do
    state
      |> update_shortest_path()
      |> update_origin()
  end

  defp recursive_backtrack(%{ origin: x, destination: x } = state) do
    if( length(state.current_path) <  state.shortest_length ) do
      state
        |> update_shortest_path()
        |> update_origin()
    else
      state
        |> update_origin()
    end
  end

  # general case
  defp recursive_backtrack(state) do
    if(state |> visited?) do
      state
    else
      { :ok, iterator } = Iterator.start(state.graph[ state.origin ])

      state
        |> visit_node(state.origin)
        |> iterate_connections(iterator)
        |> update_current_path()
        |> update_origin()
    end
  end

  # iterate recursively over a list of nodes
  defp iterate_connections(state, iterator) do
    state
      |> handle_next(iterator, iterator |> Iterator.next())
  end

  defp handle_next(state, _iterator, nil) do
    state
  end

  defp handle_next(state, iterator, next_node) do
    state
      |> Map.put(:origin, next_node)
      |> recursive_backtrack()
      |> iterate_connections(iterator)
  end

  defp visit_node(state, node) do
    state
      |> Map.put(:current_path, [ node | state.current_path ])
  end

  defp visited?(state) do
    state.current_path |>
      Enum.find_value(&( &1 == state.origin ))
  end

  defp update_origin(state) do
    state
      |> Map.put(:origin, state.current_path |> List.first())
  end

  defp update_current_path(state) do
    { _, new_current_path } = state.current_path |> List.pop_at(0)

    state
      |> Map.put(:current_path, new_current_path)
  end

  defp update_shortest_path(state) do
    state
      |> Map.put(:shortest_path, state.current_path)
      |> Map.put(:shortest_length, length(state.current_path))
  end

end
