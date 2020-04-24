require_relative("../db/sql_runner")

class Lesson
  attr_reader(:id, :name, :first_name, :last_name, :phone, :week_day, :price, :max_capacity, :active)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    # class name
    @name = options["name"]
    # instructor first & last names
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @phone = options["phone"]
    @week_day = options["week_day"]
    @price = options["price"].to_f
    @max_capacity = options["max_capacity"].to_i
    # is the lesson still available/active
    @active = options["active"]
  end

  def save()
    sql = "INSERT INTO lessons
    (
      name,
      first_name,
      last_name,
      phone,
      week_day,
      price,
      max_capacity,
      active
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @first_name, @last_name, @phone, @week_day, @price, @max_capacity, @active]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id
  end

  def update()
    sql = "UPDATE lessons SET
    (
      name,
      first_name,
      last_name,
      phone,
      week_day,
      price,
      max_capacity,
      active
    )
    =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM lessons;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM lessons;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Lesson.new(hash) }
  end

  def self.all_active()
    sql = "SELECT * FROM lessons WHERE active = true;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Lesson.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM lessons
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Lesson.new(results.first)
  end

  def lesson_customers()
  end

  def lesson_class_size()
  end

  def pretty_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def self.map_items(lesson_data)
    return lesson_data.map { |lesson| Lesson.new(lesson) }
  end
end
