require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/transaction')
require_relative ('./models/account')
require_relative ('./models/merchant')
require_relative ('./models/tag')


get '/transaction/new' do
@accounts = Account.all
@tags = Tag.all
@merchants = Merchant.all
# binding.pry
erb ( :'transactions/new' )
end

get '/transaction' do
  @transactions = Transaction.all_pretty()
  # binding.pry
  erb ( :'transactions/index' )
end

post '/transaction' do
# binding.pry
@transaction = Transaction.new(params)
@account = Account.find(@transaction.account_id)
@account.balance -= @transaction.amount
@transaction.save()
@account.update()
# binding.pry
erb ( :'transactions/create' )
end

get '/transaction/:id' do 
  @transaction = Transaction.find(params[:id])
  # binding.pry
  erb ( :'transactions/show' )
end

get'/transaction/:id/edit' do

@transaction = Transaction.find(params[:id])
erb (:'transactions/edit')

end

post'/transaction/:id' do 
  @transaction = Account.update(params)
  redirect to("/transaction/#{params[:id]}")

end

post '/transaction/:id/delete' do
  Transaction.delete( params[:id])
  redirect to('/transaction')
end