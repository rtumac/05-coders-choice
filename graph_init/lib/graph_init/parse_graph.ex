defmodule GraphInit.ParseGraph do

  def new_graph do
    %GraphInit.State{}.adjacency_list
  end

  def parse_titles do
    titles = File.stream! "../data/title.principals.tsv"

    titles
      |> Enum.take(5)
      |> Enum.map(&String.trim/1)
      |> Enum.map(fn x -> x |> String.split("\t") end)
      |> Enum.map(&IO.puts()/1)
  end

end
