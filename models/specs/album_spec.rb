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
        'artist_id' => @artist1.id
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

end
