require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ArrayTest < Minitest::Test
  def test_if_x_in_array
    list = ['abc']
    refute_includes list, 'xyz'
  end
end