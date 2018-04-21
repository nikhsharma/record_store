require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/artist.rb')

get '/artists' do
  @artists = Artist.all()
  erb(:"artists/index")
end

get '/artists/:id' do
  @artist = Artist.find_by_id(params['id'].to_i)
  erb(:"artists/show")
end
