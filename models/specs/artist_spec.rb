require('minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')

class TestArtist < MiniTest::Test

  def setup()
    @artist1 = Artist.new(
      {
        'name' => 'Radiohead'
      }
    )
  end

  def test_artist_get_name()
    assert_equal("Radiohead", @artist1.name)
  end

end
