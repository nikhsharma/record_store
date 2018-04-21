require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/artist.rb')

get '/artists' do
  erb(:"artists/index")
end
