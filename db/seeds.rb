require('pry-byebug')
require_relative('../models/artist.rb')
require_relative('../models/album.rb')

Album.delete_all()
Artist.delete_all()

radiohead = Artist.new(
  {
    'name' => 'Radiohead',
    'profile_image' => '/images/radiohead_profile.jpg'
  }
)

gogopenguin = Artist.new(
  {
    'name' => 'GoGo Penguin',
    'profile_image' => '/images/gogo_penguin_profile.jpg'
  }
)

childishgambino = Artist.new(
  {
    'name' => 'Childish Gambino',
    'profile_image' => '/images/childish_gambino_profile.jpeg'
  }
)

beyonce = Artist.new(
  {
    'name' => 'Beyonce',
    'profile_image' => '/images/beyonce_profile.jpg'
  }
)

alabamashakes = Artist.new(
  {
    'name' => 'Alabama Shakes',
    'profile_image' => '/images/alabama_shakes_profile.jpg'
  }
)

altj = Artist.new(
  {
    'name' => 'Alt-J',
    'profile_image' => '/images/altj_profile.png'
  }
)

radiohead.save()
gogopenguin.save()
childishgambino.save()
beyonce.save()
alabamashakes.save()
altj.save()


kida = Album.new(
  {
    'title' => 'Kid A',
    'stock' => 2,
    'genre' => 'Alternative',
    'artist_id' => radiohead.id,
    'buy_price' => 6,
    'sell_price' => 10,
    'artwork' => '/images/kid_a.jpg'
  }
)

amoonshapedpool = Album.new(
  {
    'title' => 'A Moon Shaped Pool',
    'stock' => 3,
    'genre' => 'Alternative',
    'artist_id' => radiohead.id,
    'buy_price' => 8,
    'sell_price' => 11,
    'artwork' => '/images/a_moon_shaped_pool.jpg'
  }
)

v20 = Album.new(
  {
    'title' => 'v2.0',
    'stock' => 1,
    'genre' => 'Jazz',
    'artist_id' => gogopenguin.id,
    'buy_price' => 4,
    'sell_price' => 8,
    'artwork' => '/images/v2-0.jpg'
  }
)

manmadeobject = Album.new(
  {
    'title' => 'Man Made Object',
    'stock' => 1,
    'genre' => 'Jazz',
    'artist_id' => gogopenguin.id,
    'buy_price' => 6,
    'sell_price' => 10,
    'artwork' => '/images/man_made_object.jpg'
  }
)

awakenmylove = Album.new(
  {
    'title' => '"Awaken, My Love!"',
    'stock' => 4,
    'genre' => 'R&B',
    'artist_id' => childishgambino.id,
    'buy_price' => 7,
    'sell_price' => 11,
    'artwork' => '/images/awaken_my_love.jpg'
  }
)

lemonade = Album.new(
  {
    'title' => 'Lemonade',
    'stock' => 8,
    'genre' => 'R&B',
    'artist_id' => beyonce.id,
    'buy_price' => 8,
    'sell_price' => 13,
    'artwork' => '/images/lemonade.jpg'
  }
)

soundandcolor = Album.new(
  {
    'title' => 'Sound and Color',
    'stock' => 8,
    'genre' => 'Alternative',
    'artist_id' => alabamashakes.id,
    'buy_price' => 5,
    'sell_price' => 10,
    'artwork' => '/images/sound_and_color.jpg'
  }
)

anawesomewave = Album.new(
  {
    'title' => 'An Awesome Wave',
    'stock' => 8,
    'genre' => 'Alternative',
    'artist_id' => altj.id,
    'buy_price' => 4,
    'sell_price' => 9,
    'artwork' => '/images/an_awesome_wave.jpg'
  }
)

kida.save()
amoonshapedpool.save()
v20.save()
manmadeobject.save()
awakenmylove.save()
lemonade.save()
soundandcolor.save()
anawesomewave.save()

binding.pry
nil
