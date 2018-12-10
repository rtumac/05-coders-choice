defmodule GraphInit do
  @moduledoc """
  Documentation for GraphInit.
  """

  @doc """
  Hello world.
  """

  defdelegate new_graph(), to: GraphInit.ParseGraph

  defdelegate parse_titles(), to: GraphInit.ParseGraph

end
