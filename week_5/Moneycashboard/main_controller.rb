require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('account_controller')
require_relative ('merchant_controller')
require_relative ('transaction_controller')
require_relative ('./models/account')
require_relative ('./models/merchant')
require_relative ('./models/transaction')
