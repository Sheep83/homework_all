require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../songs')
require_relative ('../guests')

class TestRooms < Minitest::Test

  def setup
      @song1 = Song.new("artist1", "title1")
      @song2 = Song.new("artist2", "title2")
      @bar = Bar.new([], [@song1, @song2])
      @room = Room.new( [], [] )
  end

  def test_add_song_to_room
    @room.songs.push(@song1)
    # binding.pry
    assert_equal("artist1", @room.songs[0].artist)
  end
end

