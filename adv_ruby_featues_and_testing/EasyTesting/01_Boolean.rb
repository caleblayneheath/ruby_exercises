require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < Minitest::Test
  def test_odd?
    value = 2
    assert_equal(true, value.odd?, 'value is not odd')
  end
end