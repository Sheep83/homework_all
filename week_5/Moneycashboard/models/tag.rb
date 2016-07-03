require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader( :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO tags (name) VALUES ('#{@name}') RETURNING *"
    tag_data = run_sql(sql)
    @id = tag_data.first['id'].to_i
  end

  def transactions
    sql = "SELECT transactions.trans_date, tags.name, transactions.amount, transactions.type, transactions.description FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE tags.id = #{@id}"
    results_array = run_sql(sql)
    results = results_array.map { |result| Result.new(result)}
    return results
  
  end


end
