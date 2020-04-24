require("minitest/autorun")
require("minitest/reporters")
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../lesson")

class TestLesson < MiniTest::Test
  def setup
    options = { "id" => 1, "name" => "yoga", "first_name" => "Jeff", "last_name" => "Insti", "phone" => "11111111111", "week_day" => "Monday", "price" => 1, "max_capacity" => 10, "active" => true }

    @lesson1 = Lesson.new(options)
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

  def test_active()
    result = @lesson1.active()
    assert_equal(true, result)
  end
end
