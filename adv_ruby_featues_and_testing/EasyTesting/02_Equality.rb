require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class StringTest < Minitest::Test
  def test_downcase
    string = 'XYZ'
    assert_equal 'xyz', string.downcase
  end

end