require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")

class TestCustomer < MiniTest::Test
  def setup
    options = { "id" => 1, "first_name" => "Bob", "last_name" => "Smith", "phone" => "11111111111", "funds" => 10 }
    @customer1 = Customer.new(options)
  end

  def test_id()
    result = @customer1.id()
    assert_equal(1, result)
  end

  def test_first_name()
    result = @customer1.first_name()
    assert_equal("Bob", result)
  end

  def test_last_name()
    result = @customer1.last_name()
    assert_equal("Smith", result)
  end

  def test_phone()
    result = @customer1.phone()
    assert_equal("11111111111", result)
  end

  def test_funds()
    result = @customer1.funds()
    assert_equal(10, result)
  end
end
