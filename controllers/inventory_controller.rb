require('sinatra')
require('sinatra/contrib/all')

get '/inventory' do
  @artists = Artist.all()
  @all_genres = Album.all_genres()
  erb(:"/inventory/index")
end

post '/inventory/:id/update' do
  @album = Album.find_by_id(params['id'])
  @album.stock = params['stock']
  @album.update()
  @all_genres = Album.all_genres()
  redirect to '/inventory'
end

get '/inventory/sort-by-title-asc' do
  @albums = Album.all_by_title_asc()
  @all_genres = Album.all_genres()
  erb(:"inventory/sort-asc")
end

get '/inventory/sort-by-title-desc' do
  @albums = Album.all_by_title_desc()
  @all_genres = Album.all_genres()
  erb(:"inventory/sort-desc")
end

get '/inventory/sort-by-stock-asc' do
  @albums = Album.all_by_stock_asc()
  @all_genres = Album.all_genres()
  erb(:"inventory/sort-asc")
end

get '/inventory/sort-by-stock-desc' do
  @albums = Album.all_by_stock_desc()
  @all_genres = Album.all_genres()
  erb(:"inventory/sort-desc")
end

get '/inventory/sort-by-artist-desc' do
  @artists = Artist.all_desc()
  @all_genres = Album.all_genres()
  erb(:"inventory/index-desc")
end

get '/inventory/filter' do
  @artists= Artist.all()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filter-asc")
end

get '/inventory/filter-artist-desc/:genre' do
  @artists= Artist.all_desc()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filter-desc")
end

get '/inventory/filter-artist-asc/:genre' do
  @artists= Artist.all()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filter-asc")
end

get '/inventory/filter-title-asc/:genre' do
  @albums = Album.all_by_title_asc()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filtered-asc")
end

get '/inventory/filter-title-desc/:genre' do
  @albums = Album.all_by_title_desc()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filtered-desc")
end

get '/inventory/filter-stock-asc/:genre' do
  @albums = Album.all_by_stock_asc()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filtered-asc")
end

get '/inventory/filter-stock-desc/:genre' do
  @albums = Album.all_by_stock_desc()
  @all_genres = Album.all_genres()
  @genre = params['genre']
  erb(:"inventory/filtered-desc")
end
