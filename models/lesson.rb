require_relative("../db/sql_runner")

class Lesson
  attr_reader(:id, :name, :first_name, :last_name, :phone, :week_day, :price, :max_capacity, :active )

  def initialize(options)
    @id = options["id"].to_i if options['id']
    # class name
    @name = options['name']
    # instructor first & last names
    @first_name = options['first_name']
    @last_name = options['last_name']
    @phone = options['phone']
    @week_day = options['week_day']
    @price = options['price'].to_f
    @max_capacity = options['max_capacity'].to_i
    # is the lesson still available/active
    @active = options['active'] 
  end

  def self.delete_all
    sql = "DELETE FROM lessons"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM lessons"
    results = SqlRunner.run(sql)
    return results.map { |hash| Lesson.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM lessons
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Lesson.new(results.first)
  end
end