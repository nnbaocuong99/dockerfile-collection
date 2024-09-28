ExUnit.start()

defmodule ExampleTest do
  use ExUnit.Case

  test "addition" do
    assert 2 + 2 == 4
  end

  test "string concatenation" do
    assert "Hello, " <> "World!" == "Hello, World!"
  end

  test "list operations" do
    list = [1, 2, 3]
    assert length(list) == 3
    assert 2 in list
  end
end

# Custom test runner
defmodule TestRunner do
  def run do
    IO.puts "Running Elixir tests..."
    
    # Capture ExUnit output
    ExUnit.configure(formatters: [ExUnit.CLIFormatter])
    
    # Run tests and capture results
    {output, exit_code} = System.cmd("mix", ["test", "--no-color"],
      stderr_to_stdout: true,
      into: IO.stream(:stdio, :line)
    )

    # Parse results
    results = parse_results(output)
    
    IO.puts "Tests run: #{results.total}"
    IO.puts "Tests passed: #{results.passed}"
    IO.puts "Tests failed: #{results.failed}"
  end

  defp parse_results(output) do
    output
    |> String.split("\n")
    |> Enum.reduce(%{total: 0, passed: 0, failed: 0}, fn line, acc ->
      cond do
        String.contains?(line, "test") and String.contains?(line, "failure") ->
          %{acc | total: acc.total + 1, failed: acc.failed + 1}
        String.contains?(line, "test") ->
          %{acc | total: acc.total + 1, passed: acc.passed + 1}
        true ->
          acc
      end
    end)
  end
end

TestRunner.run()

# To run: elixir testscript.exs
