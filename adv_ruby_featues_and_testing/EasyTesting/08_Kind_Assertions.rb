require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumericTest < Minitest::Test
  def test_exactly_numeric
    value = 3
    assert_kind_of Numeric, 3
  end
end