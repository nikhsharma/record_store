require('minitest/autorun')
require('minitest/rg')

require_relative('../album.rb')
require_relative('../artist.rb')

class TestAlbum < MiniTest::Test

  def setup()
    @artist1 = Artist.new(
      {
        'id' => 1,
        'name' => 'Radiohead'
      }
    )

    @album1 = Album.new(
      {
        'id' => 1,
        'title' => 'Kid A',
        'stock' => 2,
        'genre' => 'alternative',
        'artist_id' => @artist1.id,
        'buy_price' => 6,
        'sell_price' => 10
      }
    )

    @album2 = Album.new(
      {
        'id' => 1,
        'title' => 'Amnesiac',
        'stock' => 5,
        'genre' => 'alternative',
        'artist_id' => @artist1.id,
        'buy_price' => 6,
        'sell_price' => 10
      }
    )

    @album3 = Album.new(
      {
        'id' => 1,
        'title' => 'A Moon Shaped Pool',
        'stock' => 10,
        'genre' => 'alternative',
        'artist_id' => @artist1.id,
        'buy_price' => 6,
        'sell_price' => 10
      }
    )
  end

  def test_get_id()
    assert_equal(1, @album1.id)
  end

  def test_get_title()
    assert_equal("Kid A", @album1.title)
  end

  def test_get_stock()
    assert_equal("alternative", @album1.genre)
  end

  def test_get_artists_id()
    assert_equal(1, @album1.artist_id)
  end

  def test_get_stock_level()
    assert_equal("Low", @album1.stock_level)
    assert_equal("Medium", @album2.stock_level)
    assert_equal("High", @album3.stock_level)
  end

  def test_album_has_buy_price()
    assert_equal(6, @album1.buy_price)
  end

  def test_album_has_sell_price()
    assert_equal(10, @album1.sell_price)
  end

  def test_get_markup()
    assert_equal(4, @album1.markup)
  end

end
