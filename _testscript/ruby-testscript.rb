# test_script.rb

require 'minitest/autorun'

class TestExample < Minitest::Test
  def test_addition
    assert_equal 2, 1 + 1
  end

  def test_subtraction
    assert_equal 2, 5 - 3
  end

  def test_multiplication
    assert_equal 6, 2 * 3
  end

  def test_division
    assert_equal 3, 6 / 2
  end
end

# Run tests using the command: ruby test_script.rb
