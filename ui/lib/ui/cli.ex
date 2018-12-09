defmodule Ui.Cli do

  def start() do
    GraphInit.new_graph
      |> start()
  end

  def start(state) do
    state
      |> main_menu()
  end

  def main_menu(state) do
    # clear_screen()
    print_menu_options()
    selection = get_selection()

    case selection do
      "1" ->
        get_actors_names(state)

      "2" ->
        :ok

      _ ->
        IO.ANSI.format([:red, "\nInvalid option. Please try again"], true)
          |> IO.puts()

        main_menu(state)
    end
  end

  def get_actors_names(state) do
    origin = get_actor("\nFirst actor:  ")
    destination = get_actor("Second actor:  ")

    Search.get_shortest_path(origin, destination, state)
      |> Enum.map(&IO.puts()/1)

    main_menu(state)
  end

  def get_actor(prompt) do
    IO.gets(prompt)
      |> String.downcase()
      |> String.trim()
      |> String.to_atom()
  end

  defp print_menu_options() do
    IO.puts("\nBacon-o-Graph")
    IO.puts("1. Search shortes path between two actors")
    IO.puts("2. Quit")
  end

  defp get_selection() do
    IO.gets(": ") |> String.trim()
  end

  # defp clear_screen() do
  #   IO.write "\e[H\e[2J"
  # end

end
