require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer")

class TestCustomer < MiniTest::Test
  def setup
    options1 = { "id" => 1, "first_name" => "Bob", "last_name" => "Smith", "phone" => "11111111112", "funds" => 10 }
    options2 = { "id" => 2, "first_name" => "Augie", "last_name" => "Vie", "phone" => "11111111113", "funds" => 20 }
    options3 = { "id" => 3, "first_name" => "Nick", "last_name" => "Thought", "phone" => "11111111114", "funds" => 30 }
    options4 = { "id" => 4, "first_name" => "Josh", "last_name" => "Jimmy", "phone" => "71111111111", "funds" => 40 }
    options5 = { "id" => 5, "first_name" => "Corey", "last_name" => "Sloan", "phone" => "81111111111", "funds" => 50 }
    options6 = { "id" => 6, "first_name" => "Joe", "last_name" => "McPoor", "phone" => "91111111111", "funds" => 1 }

    @customer1 = Customer.new(options1)
    @customer2 = Customer.new(options2)
    @customer3 = Customer.new(options3)
    @customer4 = Customer.new(options4)
    @customer5 = Customer.new(options5)
    @customer6 = Customer.new(options6)
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
    assert_equal("11111111112", result)
  end

  def test_funds()
    result = @customer1.funds()
    assert_equal(10, result)
  end

  def test_pretty_name()
    result = @customer2.pretty_name()
    assert_equal("Augie Vie", result)
  end
end
