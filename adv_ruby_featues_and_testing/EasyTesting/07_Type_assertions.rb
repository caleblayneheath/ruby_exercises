require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumbericTest < Minitest::Test
  def test_if_numeric
    value = 4
    assert_instance_of Numeric, value
  end
end