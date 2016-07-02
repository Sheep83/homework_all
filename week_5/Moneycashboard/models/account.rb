require('pg')
require_relative('../db/sql_runner')

class Account

  attr_reader( :name, :balance)

  def initialize( options )
    @id = options['id'].to_i
    @user_name = options['user_name']
    @type = options['type']
    @balance = options['balance'].to_f
  end

  def save()
    sql = "INSERT INTO accounts (user_name, type, balance) VALUES ('#{@user_name}', '#{@type}', '#{@balance}') RETURNING *"
    trans_data = run_sql(sql)
    @id = trans_data.first['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM accounts"
    accounts = run_sql(sql) 
    result = accounts.map { |account| Account.new(account)}
    return result  
  end

  def self.find(id)
    sql = "SELECT * FROM accounts WHERE id=#{id}"
    account = run_sql(sql)
    result = Account.new(account.first)
    return result
  end

  def self.update(options)
    sql = "UPDATE accounts SET 
    type='#{options['type']}',
    balance='#{options['balance']}'
    WHERE id = '#{options['id']}'"
    run_sql(sql)
  end

  def self.delete( id )
    sql = "DELETE FROM accounts WHERE id=#{id}"
    run_sql(sql)
  end

  def transactions
    sql = "SELECT transactions.trans_date, merchants.name, transactions.amount, transactions.type, transactions.description from transactions INNER JOIN merchants ON transactions.merchant_id = merchants.id WHERE transactions.account_id = #{@id}"
    result = run_sql(sql)
    return result
  end

end
