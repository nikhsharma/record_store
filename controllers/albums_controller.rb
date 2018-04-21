require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/album.rb')

get '/albums' do
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/:id' do
  @album = Album.find_by_id(params['id'].to_i)
  erb(:"albums/show")
end
