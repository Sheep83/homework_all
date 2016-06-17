require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../songs')

class TestBar < Minitest::Test

  def setup
    
    song1 = Song.new("artist1", "title1")
    song2 = Song.new("artist2", "title2")
    @bar = Bar.new([], [song1, song2])
  end
  
  def test_can_select_song
    result1 = @bar.playlist[1].artist
    result2 = @bar.playlist[1].title
    assert_equal("artist2" , result1)
    assert_equal("title2" , result2)
  end

end



