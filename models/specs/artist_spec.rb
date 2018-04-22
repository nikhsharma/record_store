require('minitest/autorun')
require('minitest/rg')

require_relative('../artist.rb')

class TestArtist < MiniTest::Test

  def setup()
    @artist1 = Artist.new(
      {
        'id' => 1,
        'name' => 'Radiohead'
      }
  end

  def test_get_id()
    assert_equal(1, @artist1.id)
  end

  def test_get_name()
    assert_equal("Radiohead", @artist1.name)
  end
  
end
