require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new(
  {
    'name' => 'Radiohead'
  }
)

artist2 = Artist.new(
  {
    'name' => 'GoGo Penguin'
  }
)

artist3 = Artist.new(
  {
    'name' => 'Childish Gambino'
  }
)

artist1.save()
artist2.save()
artist3.save()


album1 = Album.new(
  {
    'title' => 'Kid A',
    'stock' => 2,
    'genre' => 'alternative',
    'artist_id' => artist1.id
  }
)

album2 = Album.new(
  {
    'title' => 'A Moon Shaped Pool',
    'stock' => 3,
    'genre' => 'alternative',
    'artist_id' => artist1.id
  }
)

album3 = Album.new(
  {
    'title' => 'v2.0',
    'stock' => 1,
    'genre' => 'jazz',
    'artist_id' => artist2.id
  }
)

album4 = Album.new(
  {
    'title' => 'Man Made Object',
    'stock' => 1,
    'genre' => 'jazz',
    'artist_id' => artist2.id
  }
)

album5 = Album.new(
  {
    'title' => '"Awaken, My Love!"',
    'stock' => 4,
    'genre' => 'R&B',
    'artist_id' => artist3.id
  }
)

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()

binding.pry
nil
