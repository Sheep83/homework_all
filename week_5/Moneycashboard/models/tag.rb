require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader( :name, :id )

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
    sql = "SELECT tags.name, transactions.amount FROM tags INNER JOIN transactions ON transactions.tag_id = tags.id WHERE tags.id = #{@id}"
    results = run_sql(sql)
    return results
  end

  def total(options)
    total = 0
    # binding.pry
    options.each do |transaction|
      total += transaction['amount'].to_f
      binding.pry
    end
    return total
  end


  def self.find(id)
    sql = "SELECT * FROM tags WHERE id=#{id}"
    tag = run_sql(sql)
    result = Tag.new(tag.first)
    return result
  end

  def self.all
    sql = "SELECT * FROM tags"
    tags = run_sql(sql) 
    result = tags.map { |tag| Tag.new(tag)}
    return result  
  end


end
