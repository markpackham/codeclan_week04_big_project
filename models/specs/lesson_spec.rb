require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../lesson")

class TestLesson < MiniTest::Test
  def setup
    options1 = { "id" => 1, "name" => "yoga", "first_name" => "Jeff", "last_name" => "Insti", "phone" => "11111111111", "week_day" => "Monday", "price" => 1, "max_capacity" => 10, "active" => true }
    options2 = { "id" => 2, "name" => "weight lifting", "first_name" => "Keith", "last_name" => "Vaz", "phone" => "21111111111", "week_day" => "Tuesday", "price" => 2, "max_capacity" => 20, "active" => true }
    options3 = { "id" => 3, "name" => "fencing", "first_name" => "Alan", "last_name" => "McBlade", "phone" => "31111111111", "week_day" => "Wednesday", "price" => 3, "max_capacity" => 30, "active" => true }
    options4 = { "id" => 4, "name" => "karate", "first_name" => "Yoshi", "last_name" => "Splinter", "phone" => "41111111111", "week_day" => "Thursday", "price" => 4, "max_capacity" => 40, "active" => true }
    options5 = { "id" => 5, "name" => "gymnatics", "first_name" => "Molly", "last_name" => "Holly", "phone" => "51111111111", "week_day" => "Friday", "price" => 5, "max_capacity" => 50, "active" => true }
    options6 = { "id" => 6, "name" => "solo yoga", "first_name" => "Jeff", "last_name" => "Insti", "phone" => "11111111111", "week_day" => "Monday", "price" => 6000, "max_capacity" => 1, "active" => false }

    @lesson1 = Lesson.new(options1)
    @lesson2 = Lesson.new(options2)
    @lesson3 = Lesson.new(options3)
    @lesson4 = Lesson.new(options4)
    @lesson5 = Lesson.new(options5)
    @lesson6 = Lesson.new(options6)
  end

  def test_id()
    result = @lesson1.id()
    assert_equal(1, result)
  end

  def test_name()
    result = @lesson1.name()
    assert_equal("yoga", result)
  end

  def test_first_name()
    result = @lesson1.first_name()
    assert_equal("Jeff", result)
  end

  def test_last_name()
    result = @lesson1.last_name()
    assert_equal("Insti", result)
  end

  def test_phone()
    result = @lesson1.phone()
    assert_equal("11111111111", result)
  end

  def test_week_day()
    result = @lesson1.week_day()
    assert_equal("Monday", result)
  end

  def test_price()
    result = @lesson1.price()
    assert_equal(1, result)
  end

  def test_max_capacity()
    result = @lesson1.max_capacity()
    assert_equal(10, result)
  end

  def test_active__true()
    result = @lesson1.active()
    assert_equal(true, result)
  end

  def test_active__false()
    result = @lesson6.active()
    assert_equal(false, result)
  end

  def test_pretty_name()
    result = @lesson4.pretty_name()
    assert_equal("Yoshi Splinter", result)
  end

  def test_reduce_max_capacity()
    result = @lesson5.reduce_max_capacity
    assert_equal(49, result)
  end
end
