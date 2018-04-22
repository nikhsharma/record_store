require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')



get '/' do
  @artists = Artist.all()
  erb(:index)
end


get '/search' do
 @artist = Artist.find_by_name(params['name'])
    erb(:"artists/show")
end
