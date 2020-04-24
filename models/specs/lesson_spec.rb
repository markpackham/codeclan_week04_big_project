require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../lesson")

class TestLesson < MiniTest::Test

  def setup
    options = {"id" => 1}

    @lesson1 = Lesson.new(options)
  end

  def test_id()
    result = @lesson1.id()
    assert_equal(1, result)
  end

end