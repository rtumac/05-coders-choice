defmodule GraphInit.State do

  defstruct(
    adjacency_list: %{      #adjacency list representing all the connections in the graph
      # Bacon:   [:Hoffman, :Pollak],
      # Pollak:  [:Bacon, :Hoffman],
      # Hoffman: [:Bacon, :Pollak, :Foster],
      # Foster:  [:Hoffman]


      Malkovich: [:Hoffman],
      Hoffman:   [:Malkovich, :Bacon, :Foster, :Pollak],
      Bacon:     [:Hoffman, :Pollak, :Welker, :Stone],
      Foster:    [:Hoffman],
      Pollak:    [:Hoffman, :Bacon],
      Wilson:    [:Giallini, :Stone, :Jaoui],
      Giallini:  [:Wilson, :Molinari],
      Molinari:  [:Giallini, :Welker],
      Welker:    [:Molinari, :Bacon],
      Stone:     [:Bacon, :Wilson],
      Jaoui:     [:Wilson]
    }
  )

end
