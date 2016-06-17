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
      @songs = [song1, song2, song3, song4] 
      # binding.pry
    end

    def test_song_artist_and_title_from_array
    assert_equal( "Pink Floyd", @songs[0].artist )
    assert_equal( "Comfortably Numb", @songs[0].title )
    end


end


