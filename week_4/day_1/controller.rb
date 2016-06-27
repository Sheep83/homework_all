require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require('json')


get '/about_us' do
  erb( :about_us )
end

get '/' do
  erb( :home )
end

get '/wishlist' do
  erb( :wishlist )
end

get '/contact' do
  erb( :contact )
end

get '/resources' do
  erb( :resources )
end

get '/moc' do
  erb( :moc )
end

get '/loose' do
  erb ( :loose )
end

get '/boxed' do
  erb ( :boxed )
end








