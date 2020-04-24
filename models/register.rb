require_relative("../db/sql_runner")

class Register
  attr_reader(:id, :customer_id, :lesson_id)

  def initialize(options)
    @id = options["id"].to_i if options['id'],
    @customer_id = options["customer_id"].to_i,
    @lesson_id = options["lesson_id"].to_i
  end


  def self.delete_all
    sql = "DELETE FROM registers"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM registers"
    results = SqlRunner.run(sql)
    return results.map { |hash| Register.new(hash) }
  end

  def self.find(id)
    sql = "SELECT * FROM registers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Register.new(results.first)
  end

  def register()
  end

end
