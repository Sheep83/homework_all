require('pg')
require_relative('../db/sql_runner')

class Result

  attr_reader( :merchant_id, :date, :m_name, :amount, :text, :type )

  def initialize( options )
    @id = options['id'].to_i
    @date = options['trans_date']
    @m_name = options['name']
    @amount = options['amount']
    @type = options['type']
    @text = options['description']
  end
end
