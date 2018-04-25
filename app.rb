require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')
require_relative('controllers/inventory_controller.rb')



get '/' do
  @artists = Artist.all()
  @albums = Album.all()
  erb(:index)
end

get '/search' do
  @artist = Artist.find_by_name(params['name'])
  @album = Album.find_by_title(params['name'])
  if (@artist == nil) && (@album == nil)
    @artists = Artist.all()
    @albums = Album.all()
    erb(:not_found)
  elsif @artist != nil && @album == nil
    erb(:"artists/show")
  else
    erb(:"albums/show")
  end
end
