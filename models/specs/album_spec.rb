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

end
