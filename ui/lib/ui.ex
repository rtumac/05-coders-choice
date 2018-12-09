defmodule Ui do
  @moduledoc """
  Documentation for Ui.
  """

  @doc """
  Hello world.

  ## Examples

  #    iex> Ui.hello()
  #   :world

  """

  defdelegate start(), to: Ui.Cli

end
