require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')

get '/albums' do
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/new' do
  @artists = Artist.all()
  erb(:"albums/new")
end

post '/albums' do
  album = Album.new(params)
  album.save()
  redirect to "/albums"
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb(:"albums/show")
end

post '/albums/:id/delete' do
Album.find_by_id(params['id'].to_i).delete()
redirect to ("/albums")
end
