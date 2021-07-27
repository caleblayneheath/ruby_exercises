require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ListTest < Minitest::Test
  def test_list_proccess_different
    assert_same list, list.process
  end
end