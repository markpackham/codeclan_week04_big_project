require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../register")

class TestRegister < MiniTest::Test

  def setup
    options1 = {"id" => 1, "customer_id" => 1, "lesson_id"=> 1}
    options2 = {"id" => 2, "customer_id" => 2, "lesson_id"=> 2}
    options3 = {"id" => 3, "customer_id" => 3, "lesson_id"=> 3}
    options4 = {"id" => 4, "customer_id" => 4, "lesson_id"=> 4}
    options5 = {"id" => 5, "customer_id" => 5, "lesson_id"=> 5}

    @register1 = Register.new(options1)
    @register2 = Register.new(options2)
    @register3 = Register.new(options3)
    @register4 = Register.new(options4)
    @register5 = Register.new(options5)
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