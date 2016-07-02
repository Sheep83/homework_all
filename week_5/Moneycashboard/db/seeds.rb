require('pg')
require_relative('sql_runner')
require_relative('../models/account')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')

account1_init = {
  'user_name' => 'brian',
  'type' => 'current',
  'balance' => '94.26'
}
account2_init = {
  'user_name' => 'brian',
  'type' => 'savings',
  'balance' => '1000',
}
merchant1_init = {
  'name' => 'Amazon'
} 
merchant2_init = {
  'name' => 'eBay'
}
tag1_init = {
  'type' => 'dvd'
}
tag2_init = {
  'type' => 'star wars'
}
transaction1_init = {
  'account_id' => '1',
  'merchant_id' => '1',
  'tag_id' => '1',
  'amount' => '25',
  'trans_date' => '2016-07-01',
  'description' => 'desc1',
  'type' => 'cash'
}
transaction2_init = {
  'account_id' => '1',
  'merchant_id' => '2',
  'tag_id' => '1',
  'amount' => '50',
  'trans_date' => '2016-07-02',
  'description' => 'desc2',
  'type' => 'debit'
}
transaction3_init = {
  'account_id' => '1',
  'merchant_id' => '1',
  'tag_id' => '2',
  'amount' => '75',
  'trans_date' => '2016-06-30',
  'description' => 'desc3',
  'type' => 'cash'
}
transaction4_init = {
  'account_id' => '1',
  'merchant_id' => '1',
  'tag_id' => '2',
  'amount' => '100',
  'trans_date' => '2016-07-02',
  'description' => 'desc4',
  'type' => 'debit'
}

account1 = Account.new( account1_init )
account2 = Account.new( account2_init )
account1.save
account2.save



