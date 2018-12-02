defmodule SearchTest do
  use ExUnit.Case
  doctest Search

  test "search path to self" do
    assert Search.get_shortest_path(:Bacon, :Bacon) == []
  end

  test "search path within 1 hop" do
    assert Search.get_shortest_path(:Bacon, :Stone) == [:Bacon, :Stone]
  end

  test "2" do
    assert Search.get_shortest_path(:Bacon, :Foster) == [:Bacon, :Hoffman, :Foster]
  end

  test "3" do
    assert Search.get_shortest_path(:Jaoui, :Foster) == [:Jaoui, :Wilson, :Stone, :Bacon, :Hoffman, :Foster]
  end

  # Exhaustive Test #

  test "exhaustive test" do
    assert Search.get_shortest_path(:Bacon, :Hoffman) == [:Bacon, :Hoffman]
    assert Search.get_shortest_path(:Bacon, :Pollak) == [:Bacon, :Pollak]
    assert Search.get_shortest_path(:Bacon, :Foster) == [:Bacon, :Hoffman, :Foster]

    assert Search.get_shortest_path(:Hoffman, :Bacon) == [:Hoffman, :Bacon]
    assert Search.get_shortest_path(:Hoffman, :Pollak) == [:Hoffman, :Pollak]
    assert Search.get_shortest_path(:Hoffman, :Foster) == [:Hoffman, :Foster]

    assert Search.get_shortest_path(:Pollak, :Bacon) == [:Pollak, :Bacon]
    assert Search.get_shortest_path(:Pollak, :Hoffman) == [:Pollak, :Hoffman]
    assert Search.get_shortest_path(:Pollak, :Foster) == [:Pollak, :Hoffman, :Foster]

    assert Search.get_shortest_path(:Foster, :Bacon) == [:Foster, :Hoffman, :Bacon]
    assert Search.get_shortest_path(:Foster, :Hoffman) == [:Foster, :Hoffman]
    assert Search.get_shortest_path(:Foster, :Pollak) == [:Foster, :Hoffman, :Pollak]
  end

  test "destination node not in the graph" do
    assert Search.get_shortest_path(:Hoffman, :Jack) == []
  end
end
