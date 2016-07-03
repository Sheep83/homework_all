require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/account')

get '/account/new' do
erb ( :'accounts/new' )
end

get '/account' do
  @accounts = Account.all()
  # binding.pry
  erb ( :'accounts/index' )
end

post '/account' do
binding.pry
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





