require ('sinatra')
require ('sinatra/contrib/all')
require ('pry-byebug')
# require_relative ('./models/transaction')
# require_relative ('./models/account')
# require_relative ('./models/merchant')
require_relative ('./models/tag')


get '/tag/new' do
@tags = Tag.all
# @merchants = Merchant.all
# binding.pry
erb ( :'tags/new' )
end

get '/tag' do
  @tags = Tag.all()
  # binding.pry
  erb ( :'tags/index' )
end

post '/tag' do
# binding.pry
@tag = Tag.new(params)
@tag.save()
erb ( :'tags/create' )
end

get '/tag/:id' do 
  @tag = Tag.find(params[:id])
  @tag.transactions()
  # binding.pry
  erb ( :'tags/show' )
end

get'/tag/:id/transactions' do
@tag = Tag.find(params[:id])
@transactions = @tag.transactions
# binding.pry
erb (:'tags/transactions/show')

end

get'/tag/:id/edit' do
@tag = Tag.find(params[:id])
erb (:'tags/edit')

end

post'/tag/:id' do 
  @tag = Tag.update(params)
  redirect to("/tag/#{params[:id]}")

end

post '/tag/:id/delete' do
  Tag.delete( params[:id])
  redirect to('/tag')
end