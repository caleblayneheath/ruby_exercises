require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ExceptionTest < Minitest::Test
  def test_NoExperience_Error
    assert_raises NoExperienceError {employee.hire}
  end
end