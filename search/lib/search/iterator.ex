defmodule Search.Iterator do

  def new_iterator(list) do
    { :ok, agent } = Agent.start_link(fn -> list end)
    agent
  end

  def next(iterator_pid) do
    { next_node, _rest } = Agent.get_and_update(iterator_pid, &{ List.pop_at(&1, 0) })
    next_node
  end


  def new_global_iterator(list_name, list) do
    list_name = list_name |> String.to_atom()
    Agent.start_link(fn -> list end, name: list_name)
  end

  def global_next(list_name) do
    list_name
      |> String.to_atom()
      |> Agent.get_and_update( fn list ->
        { next, rest } = List.pop_at(list, 0)
        rest
      end)
  end

end
