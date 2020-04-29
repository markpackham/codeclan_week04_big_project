require("minitest/autorun")
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../customer_lesson")
require_relative("../customer")
require_relative("../lesson")

class TestRegister < MiniTest::Test

  def setup
    options1 = {"id" => 1, "customer_id" => 1, "lesson_id"=> 1}
    options2 = {"id" => 2, "customer_id" => 2, "lesson_id"=> 2}
    options3 = {"id" => 3, "customer_id" => 3, "lesson_id"=> 3}
    options4 = {"id" => 4, "customer_id" => 4, "lesson_id"=> 4}
    options5 = {"id" => 5, "customer_id" => 5, "lesson_id"=> 5}

    @customer_lesson1 = Customer_Lesson.new(options1)
    @customer_lesson2 = Customer_Lesson.new(options2)
    @customer_lesson3 = Customer_Lesson.new(options3)
    @customer_lesson4 = Customer_Lesson.new(options4)
    @customer_lesson5 = Customer_Lesson.new(options5)

    customer_options1 = { "id" => 1, "first_name" => "Bob", "last_name" => "Smith", "phone" => "11111111112", "funds" => 10 }
    @customer = Customer.new(customer_options1)

    lesson_options1 = { "id" => 1, "name" => "yoga", "first_name" => "Jeff", "last_name" => "Insti", "phone" => "11111111111", "week_day" => "Monday", "price" => 1, "max_capacity" => 10, "active" => true }
    @lesson = Lesson.new(lesson_options1)
  end

  def test_id()
    result = @customer_lesson1.id()
    assert_equal(1, result)
  end

  def test_customer_id()
    result = @customer_lesson1.customer_id()
    assert_equal(1, result)
  end

  def test_lesson_id()
    result = @customer_lesson1.lesson_id()
    assert_equal(1, result)
  end

  def test_charge_customer()
    result = @customer_lesson1.charge_customer(@customer,@lesson)
    assert_equal(9, result)
  end

end