defmodule HttpBenchmarkTest do
  use ExUnit.Case
  doctest HttpBenchmark

  test "greets the world" do
    assert HttpBenchmark.hello() == :world
  end
end
