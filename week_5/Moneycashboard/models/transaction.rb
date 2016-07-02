require('pg')
require_relative('../db/sql_runner')

class Transaction

  attr_reader( :merchant_id, :tag_id, :amount, :trans_date, :description, :type )

  def initialize( options )
    @id = options['id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @tag_id = options['tag_id'].to_i
    @amount = options['amount'].to_f
    @trans_date = options['trans_date']
    @description = options['description']
    @type = options['type']
  end

  def self.all
    # db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
    sql = "SELECT * FROM transactions"
    transactions = run_sql(sql) 
    result = transactions.map { |transaction| Transaction.new(transaction)}
    # db.close
    return result  
  end

  def total()
    return @amount
  end

  def save()
  # db = PG.connect( {dbname: 'pizza_shop', host: 'localhost'})
  sql = "INSERT INTO transactions (id, merchant_id, tag_id, amount, trans_date, description, type) VALUES ('#{@id}', '#{@merchant_id}', '#{@tag_id}', #{@amount}, #{@trans_date}, #{@description}, #{@type}) RETURNING *"
  trans_data = run_sql(sql)
  # db.close
  @id = trans_data.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id=#{id}"
    transaction = run_sql(sql)
    result = Transaction.new(transaction.first)
    return result
  end

  def self.update(options)
    sql = "UPDATE transactions SET 
          merchant_id='#{options['merchant_id']}',
          tag_id='#{options['tag_id']}',
          amount= '#{options['amount']}',
          trans_date= #{options['trans_date']},
          description= #{options['description']},
          type= #{options['type']}
          WHERE id = '#{options['id']}'"
    run_sql(sql)
  end

  def self.delete( id )
    sql = "DELETE FROM transactions WHERE id=#{id}"
    run_sql(sql)
  end

end