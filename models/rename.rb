require_relative("../db/sql_runner")

class Rename
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i
  end
end
