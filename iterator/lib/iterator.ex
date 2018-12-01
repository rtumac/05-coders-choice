defmodule Iterator do

  defdelegate start(default \\ []), to: Iterator.Iterator

  defdelegate next(server), to: Iterator.Iterator

end
