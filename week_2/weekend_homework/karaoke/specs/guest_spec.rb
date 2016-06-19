require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../song')
require_relative ('../room')

class TestGuest < Minitest::Test

  def setup
  song1 = Song.new("Pink Floyd", "Comfortably Numb")
  song2 = Song.new("Rolling Stones", "Gimme Shelter")
  song3 = Song.new("Foo Fighters", "Everlong")
  song4 = Song.new("Led Zeppelin", "The Song Remains The Same") 
  room1 = Room.new("Lizard Lounge", 4)
  room2 = Room.new("Pop 'n Bop", 8)
  room3 = Room.new("Bangin' Heads", 5)
  room4 = Room.new("Croon 'n Swoon", 6) 
  guest1 = Guest.new("Brian", 500)
  guest2 = Guest.new("Lisa", 250)
  guest3 = Guest.new("Jaime", 100)
  guest4 = Guest.new("Amelia", 0) 
  @room_array = [room1, room2, room3, room4]
  @song_array = [song1, song2, song3, song4]
  @guest_array = [guest1, guest2, guest3, guest4]
  
  @bar = Bar.new( @room_array, @song_array, @guest_array, 1000)
  end

  def test_guest_properties_from_array
    assert_equal( "Brian", @guest_array[0].name )
    assert_equal( 0, @guest_array[3].cash )
  end

  def test_add_song_to_room
    @guest_array[0].add_song_to_room(@song_array[0], @room_array[0], @bar)
    assert_equal("Comfortably Numb", @bar.rooms[0].songs[0].title)
  end


end