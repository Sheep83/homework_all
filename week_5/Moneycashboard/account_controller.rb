require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/account')

get '/account/new' do
erb ( :'accounts/new' )
end

get '/account/transfer' do
  @accounts = Account.all()
  # binding.pry
  erb ( :'transfers/new' )
end

get '/account/:id/transactions' do
@account = Account.find(params[:id])
@accounts = @account.transactions
options = @accounts.to_a
@total = @account.total(options)
# binding.pry
erb (:'accounts/transactions/show')

end
post '/account/transfer' do
# @account = Account.new(params)
# # binding.pry
# @account.save()
# binding.pry
@account1 = Account.find(params[:account1])
@account2 = Account.find(params[:account2])
@account1.balance -= params[:amount].to_f
@account2.balance += params[:amount].to_f
@account1.update
@account2.update
# binding.pry
erb ( :'/transfers/create' )
end

get '/account' do
  @accounts = Account.all()
  # binding.pry
  erb ( :'accounts/index' )
end

post '/account' do
# binding.pry
@account = Account.new(params)
# binding.pry
@account.save()
# binding.pry
erb ( :'accounts/create' )
end

get '/account/:id' do 
  @account = Account.find(params[:id])
  # binding.pry
  erb ( :'accounts/show' )
end

get'/account/:id/edit' do

@account = Account.find(params[:id])
erb (:'accounts/edit')

end

post'/account/:id' do 
  @account = Account.update(params)
  redirect to("/account/#{params[:id]}")

end

post '/account/:id/delete' do
  Account.delete( params[:id])
  redirect to('/account')
end





