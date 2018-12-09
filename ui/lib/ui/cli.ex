defmodule Ui.Cli do

  def start() do
    initialize_state()
      |> start
  end

  def start(state) do
    state
      |> main_menu()
  end


  defp initialize_state() do
    %{
      graph: GraphInit.new_graph,
      origin: nil,
      destination: nil,
      path:  []
    }
  end

  defp main_menu(state) do
    print_menu_options()
    selection = get_selection()

    case selection do
      "1" ->
        state
          |> get_actors()
          |> get_shortest_path()
          |> print_path("Shortest path:\n")
          |> main_menu()

      "2" ->
        :ok

      _ ->
        IO.ANSI.format([:red, "\nInvalid option. Please try again"], true)
          |> IO.puts()

        state |> main_menu()
    end
  end

  defp get_actors(state) do
    origin = get_one_actor(state, "First actor:  ");
    destination = get_one_actor(state, "Second actor:  ")

    state
      |> Map.put(:origin, origin)
      |> Map.put(:destination, destination)
    end

  defp get_one_actor(state, prompt) do
    actor = IO.gets(prompt)
      |> String.trim()

    processed_actor = actor
      |> String.downcase()
      |> String.to_atom()

    cond do
      state.graph |> Map.has_key?(processed_actor) ->
        processed_actor

      true ->
        IO.ANSI.format([:yellow, "\nCould not find #{actor}. Please try again"], true)
          |> IO.puts()

        get_one_actor(state, prompt)
    end
  end

  defp get_shortest_path(state) do
    path = Search.get_shortest_path(
      state.origin,
      state.destination,
      state.graph
    )

    state |> Map.put(:path, path)
  end

  defp print_path(%{ path: [] } = state, _) do
    IO.ANSI.format([:yellow, "\nNo path has been found"], true)
      |> IO.puts()
    state
  end

  defp print_path(state, prompt) do
    IO.write("\n")
    IO.write(prompt)

    state.path |> print_node()

    state
  end

  defp print_node([ head ]) do
    IO.write(head)
    IO.write("\n")
  end

  defp print_node([ head | tail ]) do
    IO.write(head)

    IO.ANSI.format([:green, " -> "], true)
      |> IO.write()

    print_node(tail)
  end

  defp print_menu_options() do
    IO.puts("\nBacon-o-Graph")
    IO.puts("1. Search shortes path between two actors")
    IO.puts("2. Quit")
  end

  defp get_selection() do
    IO.gets(": ") |> String.trim()
  end

end
