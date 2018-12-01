defmodule IteratorTest do
  use ExUnit.Case
  doctest Iterator

  test "empty list" do
    { :ok, pid } = Iterator.start []
    assert Iterator.next(pid) == nil
  end

  test "list with one element" do
    { :ok, pid } = Iterator.start [5]
    assert Iterator.next(pid) == 5
    assert Iterator.next(pid) == nil
  end

  test "subsequent calls to next" do
    { :ok, pid } = Iterator.start [3, 7, 8]
    assert Iterator.next(pid) == 3
    assert Iterator.next(pid) == 7
    assert Iterator.next(pid) == 8
    assert Iterator.next(pid) == nil
  end
end
