require_relative("../db/sql_runner")

class Register
  attr_reader(:id, :customer_id, :lesson_id)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"].to_i
    @lesson_id = options["lesson_id"].to_i
  end

  def save()
    sql = "INSERT INTO registers
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
    sql = "UPDATE registers SET
    (
      customer_id,
      lesson_id
    )
    =
    (
      $1, $2
    )
    WHERE id = $3;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM registers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM registers;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Register.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM registers
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Register.new(results.first)
  end

  def register_customer()
    # check if lesson active
    # check if customer can afford
    # check if lesson already full
  end

  def self.map_items(register_data)
    return register_data.map { |register| Register.new(register) }
  end
end
