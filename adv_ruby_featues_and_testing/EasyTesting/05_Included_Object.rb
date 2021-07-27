require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ArrayTest < Minitest::Test
  def test_if_in_array
    list = ['xyz']
    assert_includes list, 'xyz'
  end
end