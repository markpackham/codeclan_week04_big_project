require_relative("../db/sql_runner")

class Customer_Lesson
  attr_accessor(:customer_id, :lesson_id)
  attr_reader(:id)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"].to_i
    @lesson_id = options["lesson_id"].to_i
  end

  def save()
    sql = "INSERT INTO customers_lessons
    (
      customer_id,
      lesson_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@customer_id, @lesson_id]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id
  end

  def update()
    sql = "UPDATE customers_lessons SET
    (
      customer_id,
      lesson_id
    )
    =
    (
      $1, $2
    )
    WHERE id = $3;"
    values = [@customer_id, @lesson_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM customers_lessons;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers_lessons
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers_lessons;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Customer_Lesson.new(hash) }
  end

  def self.all_tables()
    sql = "SELECT * 
    FROM lessons
    INNER JOIN customers_lessons
    ON lessons.id = customers_lessons.lesson_id
    INNER JOIN customers
    ON customers.id = customers_lessons.customer_id;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Customer_Lesson.new(hash) }
  end

  
  def self.find(id)
    sql = "SELECT * FROM customers_lessons
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer_Lesson.new(results.first)
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1;"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def lesson()
    sql = "SELECT * FROM lessons
    WHERE id = $1;"
    values = [@lesson_id]
    results = SqlRunner.run(sql, values)
    return Lesson.new(results.first)
  end

  def self.lesson_numbers()
    sql = "SELECT COUNT(customers_lessons.customer_id), customers_lessons.lesson_id
        FROM customers_lessons
        GROUP BY customers_lessons.lesson_id
        ORDER BY COUNT(customers_lessons.customer_id) DESC;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Customer_Lesson.new(hash) }
  end

  def charge_customer(customer, lesson)
    customer.funds = customer.funds - lesson.price
  end

  def self.map_items(customer_lesson_data)
    return customer_lesson_data.map { |customer_lesson| Customer_Lesson.new(customer_lesson) }
  end
end
