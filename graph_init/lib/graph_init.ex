defmodule GraphInit do

  defdelegate new_graph(), to: GraphInit.ParseGraph

  defdelegate parse_titles(), to: GraphInit.ParseGraph

end
