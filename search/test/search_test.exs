defmodule SearchTest do
  use ExUnit.Case
  doctest Search

  test "search path to self" do
    assert Search.get_shortest_path(:bacon, :bacon) == []
  end

  test "search path within 1 hop" do
    assert Search.get_shortest_path(:bacon, :stone) == [:bacon, :stone]
  end

  test "2" do
    assert Search.get_shortest_path(:bacon, :foster) == [:bacon, :hoffman, :foster]
  end

  test "3" do
    assert Search.get_shortest_path(:jaoui, :foster) == [:jaoui, :wilson, :stone, :bacon, :hoffman, :foster]
  end

  # Exhaustive Test #

  test "exhaustive test" do
    assert Search.get_shortest_path(:bacon, :hoffman) == [:bacon, :hoffman]
    assert Search.get_shortest_path(:bacon, :pollak) == [:bacon, :pollak]
    assert Search.get_shortest_path(:bacon, :foster) == [:bacon, :hoffman, :foster]

    assert Search.get_shortest_path(:hoffman, :bacon) == [:hoffman, :bacon]
    assert Search.get_shortest_path(:hoffman, :pollak) == [:hoffman, :pollak]
    assert Search.get_shortest_path(:hoffman, :foster) == [:hoffman, :foster]

    assert Search.get_shortest_path(:pollak, :bacon) == [:pollak, :bacon]
    assert Search.get_shortest_path(:pollak, :hoffman) == [:pollak, :hoffman]
    assert Search.get_shortest_path(:pollak, :foster) == [:pollak, :hoffman, :foster]

    assert Search.get_shortest_path(:foster, :bacon) == [:foster, :hoffman, :bacon]
    assert Search.get_shortest_path(:foster, :hoffman) == [:foster, :hoffman]
    assert Search.get_shortest_path(:foster, :pollak) == [:foster, :hoffman, :pollak]
  end

  test "destination node not in the graph" do
    assert Search.get_shortest_path(:hoffman, :jack) == []
  end

  test "empty origin and destination" do
    assert Search.get_shortest_path(:"", :"") == []
  end
end
