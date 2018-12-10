defmodule GraphInit.State do

  defstruct(
    #adjacency list representing all the connections in the graph
    adjacency_list: %{
      malkovich: [:hoffman],
      hoffman:   [:malkovich, :bacon, :foster, :pollak],
      bacon:     [:hoffman, :pollak, :welker, :stone],
      foster:    [:hoffman],
      pollak:    [:hoffman, :bacon],
      wilson:    [:giallini, :stone, :jaoui],
      giallini:  [:wilson, :molinari],
      molinari:  [:giallini, :welker],
      welker:    [:molinari, :bacon],
      stone:     [:bacon, :wilson],
      jaoui:     [:wilson]
    }
  )

end
