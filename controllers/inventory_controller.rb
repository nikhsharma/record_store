require('sinatra')
require('sinatra/contrib/all')

get '/inventory' do
  @artists = Artist.all()
  erb(:"/inventory/index")
end
