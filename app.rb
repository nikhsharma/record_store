require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/artists_controller.rb')
require_relative('controllers/albums_controller.rb')

get '/' do
  erb(:index)
end
