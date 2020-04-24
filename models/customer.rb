require_relative("../db/sql_runner")

class Customer
  attr_reader(:id, :first_name, :last_name, :phone, :funds)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @phone = options["phone"]
    @funds = options["funds"].to_f
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      last_name,
      phone,
      funds
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @phone, @funds]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id
  end

  def update()
    sql = "UPDATE customers SET
    (
      first_name,
      last_name,
      phone,
      funds
    )
    =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM customers
    WHERE id = $1";
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    results = SqlRunner.run(sql)
    return results.map { |hash| Customer.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM customers
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def pretty_name()
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end

  def self.map_items(customer_data)
    return customer_data.map { |customer| Customer.new(customer) }
  end
end
