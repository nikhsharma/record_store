require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

get '/artists/new' do
  erb(:"artists/new")
end

post '/artists' do
  artist = Artist.new(params)
  artist.save()
  redirect to '/albums/new'
end

get '/artists/:id' do
  @artist = Artist.find_by_id(params['id'].to_i)
  erb(:"artists/show")
end

get '/artists/:id/update' do
  @artist = Artist.find_by_id(params['id'].to_i)
  erb(:"artists/update")
end

post '/artists/:id/update' do
  @artist = Artist.new(params)
  @artist.update
  redirect to '/artists'
end

post '/artists/:id/delete' do
  Artist.find_by_id(params['id']).delete()
  redirect to '/artists'
end
