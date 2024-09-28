require "spec"

describe "Example tests" do
  it "performs addition" do
    (2 + 2).should eq(4)
  end

  it "concatenates strings" do
    ("Hello, " + "World!").should eq("Hello, World!")
  end

  it "handles array operations" do
    arr = [1, 2, 3]
    arr.size.should eq(3)
    arr.should contain(2)
  end
end

# Custom test runner
module TestRunner
  extend self

  def run
    puts "Running Crystal tests..."

    passed = 0
    failed = 0

    Spec.run do |context, result|
      case result
      when Spec::Result::Success
        puts "Test '#{context.description}' passed"
        passed += 1
      when Spec::Result::Failure
        puts "Test '#{context.description}' failed: #{result.error.message}"
        failed += 1
      end
    end

    puts "Tests run: #{passed + failed}"
    puts "Tests passed: #{passed}"
    puts "Tests failed: #{failed}"
  end
end

TestRunner.run

# To run: crystal testscript.cr
