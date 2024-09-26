# test/your_app_test.exs

defmodule YourAppTest do
  use ExUnit.Case
  doctest YourApp

  test "adds two numbers" do
    assert YourApp.add(1, 1) == 2
  end

  test "adds negative numbers" do
    assert YourApp.add(-1, 1) == 0
  end

  test "adds zero" do
    assert YourApp.add(0, 0) == 0
  end
end

# Run tests using: mix test
# Make sure to set up your project with Mix
