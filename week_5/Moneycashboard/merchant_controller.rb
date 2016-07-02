require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
require_relative ('./models/merchant')

get '/merchant/new' do
erb ( :'merchants/new' )
end

post '/merchant' do
  #create pizza object
@merchant = Merchant.new(params)
# binding.pry
  #save to db
@merchant.save()
binding.pry
erb ( :'merchants/create' )

end

get '/merchant' do
  @merchants = Merchant.all()
  erb ( :'merchants/index' )
end

get '/merchant/:id' do ####find specific merchant by id
  @merchant = Merchant.find(params[:id])
  # binding.pry
  erb ( :'merchants/show' )
end

get'/merchant/:id/edit' do

@merchant = Merchant.find(params[:id])
erb (:'merchants/edit')

end

post'/merchant/:id' do 
  @merchant = Merchant.update(params)
  redirect to("/merchant/#{params[:id]}")

end

post '/merchant/:id/delete' do
  Merchant.delete( params[:id])
  redirect to('/merchant')
end





