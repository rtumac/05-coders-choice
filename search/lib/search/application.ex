defmodule Search.Application do
  use Application

  def start(_type, _args) do
    children = [
      Search.ShortestPath,
    ]

    opts = [ strategy: :one_for_one, name: Search.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
