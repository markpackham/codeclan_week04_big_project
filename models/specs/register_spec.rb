require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../register")

class TestRegister < MiniTest::Test

  def setup
    options = {"id" => 1, "customer_id" => 1, "lesson_id"=> 1}

    @register1 = Register.new(options)
  end

  def test_id()
    result = @register1.id()
    assert_equal(1, result)
  end

  def test_customer_id()
    result = @register1.customer_id()
    assert_equal(1, result)
  end

  def test_lesson_id()
    result = @register1.lesson_id()
    assert_equal(1, result)
  end

end