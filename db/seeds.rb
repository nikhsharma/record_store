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
    'artist_id' => artist1.id,
    'buy_price' => 6,
    'sell_price' => 10,
    'artwork' => '/images/kid_a.jpg'
  }
)

album2 = Album.new(
  {
    'title' => 'A Moon Shaped Pool',
    'stock' => 3,
    'genre' => 'alternative',
    'artist_id' => artist1.id,
    'buy_price' => 8,
    'sell_price' => 11,
    'artwork' => '/images/a_moon_shaped_pool.jpg'
  }
)

album3 = Album.new(
  {
    'title' => 'v2.0',
    'stock' => 1,
    'genre' => 'jazz',
    'artist_id' => artist2.id,
    'buy_price' => 4,
    'sell_price' => 8,
    'artwork' => '/images/v2-0.jpg'
  }
)

album4 = Album.new(
  {
    'title' => 'Man Made Object',
    'stock' => 1,
    'genre' => 'jazz',
    'artist_id' => artist2.id,
    'buy_price' => 6,
    'sell_price' => 10,
    'artwork' => '/images/man_made_object.jpg'
  }
)

album5 = Album.new(
  {
    'title' => '"Awaken, My Love!"',
    'stock' => 4,
    'genre' => 'R&B',
    'artist_id' => artist3.id,
    'buy_price' => 7,
    'sell_price' => 11,
    'artwork' => '/images/awaken_my_love.jpg'
  }
)

album1.save()
album2.save()
album3.save()
album4.save()
album5.save()

binding.pry
nil
