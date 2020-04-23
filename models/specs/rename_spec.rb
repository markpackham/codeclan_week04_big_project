require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../rename")

class TestRename < MiniTest::Test
  def setup
  end

  def test_()
    result = ""
    assert_equal("", result)
  end
end
