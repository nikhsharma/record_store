require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/artists_controller.rb')

get '/' do
  erb(:index)
end
