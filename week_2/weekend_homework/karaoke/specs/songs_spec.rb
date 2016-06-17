require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../songs')

class TestSongs < Minitest::Test

  def setup
    @playlist = [{"artist1" => "title1"}, {"artist2" => "title_2"}]
    @bar = Bar.new([], @playlist) 
  end

  def test_song_details
    @song = Song.new(@bar.playlist[0])
    assert_equal({"artist1" => "title1"}, @song.details)  
  end

end


