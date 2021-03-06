require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../room')
require_relative ('../guest')


class TestSong < Minitest::Test

  def setup
      song1 = Song.new("Pink Floyd", "Comfortably Numb")
      song2 = Song.new("Rolling Stones", "Gimme Shelter")
      song3 = Song.new("Foo Fighters", "Everlong")
      song4 = Song.new("Led Zeppelin", "The Song Remains The Same") 
      @song_array = [song1, song2, song3, song4] 
    end

    def test_song_artist_and_title_from_array
    assert_equal( "Pink Floyd", @song_array[0].artist )
    assert_equal( "Comfortably Numb", @song_array[0].title )
    end

end


