require('sinatra')
require('sinatra/contrib/all')

get '/inventory' do
  @artists = Artist.all()
  erb(:"/inventory/index")
end

post '/inventory/:id/update' do
  @album = Album.find_by_id(params['id'])
  @album.stock = params['stock']
  @album.update()
  redirect to '/inventory'
end
