defmodule SearchTest do
  use ExUnit.Case
  doctest Search

  test "search path to self" do
    assert Search.get_shortest_path(:bacon, :bacon, GraphInit.new_graph) == []
  end

  test "search path within 1 hop" do
    assert Search.get_shortest_path(:bacon, :stone, GraphInit.new_graph) == [:bacon, :stone]
  end

  test "search for the longest path possible" do
    assert Search.get_shortest_path(:jaoui, :foster, GraphInit.new_graph) == [:jaoui, :wilson, :stone, :bacon, :hoffman, :foster]
  end

  test "destination node not in the graph" do
    assert Search.get_shortest_path(:hoffman, :jack, GraphInit.new_graph) == []
  end

  test "empty origin and destination" do
    assert Search.get_shortest_path(:"", :"", GraphInit.new_graph) == []
  end

  test "exhaustive test of a small graph" do
    graph = %{
      bacon:   [:hoffman, :pollak],
      pollak:  [:bacon, :hoffman],
      hoffman: [:bacon, :pollak, :foster],
      foster:  [:hoffman]
    }

    assert Search.get_shortest_path(:bacon, :hoffman, graph) == [:bacon, :hoffman]
    assert Search.get_shortest_path(:bacon, :pollak, graph) == [:bacon, :pollak]
    assert Search.get_shortest_path(:bacon, :foster, graph) == [:bacon, :hoffman, :foster]

    assert Search.get_shortest_path(:hoffman, :bacon, graph) == [:hoffman, :bacon]
    assert Search.get_shortest_path(:hoffman, :pollak, graph) == [:hoffman, :pollak]
    assert Search.get_shortest_path(:hoffman, :foster, graph) == [:hoffman, :foster]

    assert Search.get_shortest_path(:pollak, :bacon, graph) == [:pollak, :bacon]
    assert Search.get_shortest_path(:pollak, :hoffman, graph) == [:pollak, :hoffman]
    assert Search.get_shortest_path(:pollak, :foster, graph) == [:pollak, :hoffman, :foster]

    assert Search.get_shortest_path(:foster, :bacon, graph) == [:foster, :hoffman, :bacon]
    assert Search.get_shortest_path(:foster, :hoffman, graph) == [:foster, :hoffman]
    assert Search.get_shortest_path(:foster, :pollak, graph) == [:foster, :hoffman, :pollak]
  end

end
