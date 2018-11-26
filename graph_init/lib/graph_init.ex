defmodule GraphInit do
  @moduledoc """
  Documentation for GraphInit.
  """

  @doc """
  Hello world.
  """

  defdelegate new_graph(), to: GraphInit.ParseGraph

end
