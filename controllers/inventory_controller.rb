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

get '/inventory/sort-by-title-asc' do
  @albums = Album.all_by_title_asc()
  erb(:"inventory/sort-asc")
end

get '/inventory/sort-by-title-desc' do
  @albums = Album.all_by_title_desc()
  erb(:"inventory/sort-desc")
end

get '/inventory/sort-by-stock-asc' do
  @albums = Album.all_by_stock_asc()
  erb(:"inventory/sort-asc")
end

get '/inventory/sort-by-stock-desc' do
  @albums = Album.all_by_stock_desc()
  erb(:"inventory/sort-desc")
end

get '/inventory/sort-by-artist-desc' do
  @artists = Artist.all_desc()
  erb(:"inventory/index-desc")
end
