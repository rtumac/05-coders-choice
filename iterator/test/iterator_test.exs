defmodule IteratorTest do
  use ExUnit.Case
  doctest Iterator

  test "greets the world" do
    assert Iterator.hello() == :world
  end
end
