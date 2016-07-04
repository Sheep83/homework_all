require('pg')
require_relative('../db/sql_runner')
require_relative('result')

class Merchant

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def self.all
    sql = "SELECT * FROM merchants"
    merchants = run_sql(sql) 
    result = merchants.map { |merchant| Merchant.new(merchant)}
    return result  
  end

  def name()
    return @name
  end

  def save()
    sql = "INSERT INTO merchants (name) VALUES ('#{@name}') RETURNING *"
    merch_data = run_sql(sql)
    @id = merch_data.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id=#{id}"
    merchant = run_sql(sql)
    result = Merchant.new(merchant.first)
    return result
  end

  def self.update(options)
    sql = "UPDATE merchants SET 
    name='#{options['name']}'
    WHERE id = '#{options['id']}'"
    run_sql(sql)
  end

  def self.delete( id )
    sql = "DELETE FROM merchants WHERE id=#{id}"
    run_sql(sql)
  end

  def transactions
    sql = "SELECT merchants.name, transactions.amount FROM merchants INNER JOIN transactions ON transactions.merchant_id = merchants.id WHERE transactions.merchant_id = #{@id}"
    results_array = run_sql(sql)
    results = results_array.map { |result| Result.new(result)}
    return results
  end


end