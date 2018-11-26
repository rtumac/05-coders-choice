defmodule SearchTest do
  use ExUnit.Case
  doctest Search

  test "search path to self" do
    assert Search.get_shortest_path(:Bacon, :Bacon) == []
  end

  test "search path within 1 hop" do
    assert Search.get_shortest_path(:Bacon, :Stone) == [:Bacon, :Stone]
  end
end
