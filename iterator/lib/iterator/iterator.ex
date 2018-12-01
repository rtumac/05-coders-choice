defmodule Iterator.Iterator do
  use GenServer

  #  API  #

  def start(default) do
    GenServer.start(__MODULE__, default)
  end

  def next(server) do
    GenServer.call(server, :next)
  end

  #  Server Implementation  #

  def init(args) do
    { :ok, args }
  end

  def handle_call(:next, _from, state) do
    { response, new_state } = state |> List.pop_at(0)
    { :reply, response, new_state }
  end

end
