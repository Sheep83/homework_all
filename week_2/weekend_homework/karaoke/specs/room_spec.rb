require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../song')
require_relative ('../guest')

class TestRoom < Minitest::Test

  def setup
   room1 = Room.new("Lizard Lounge", 4)
   room2 = Room.new("Pop 'n Bop", 8)
   room3 = Room.new("Bangin' Heads", 5)
   room4 = Room.new("Croon 'n Swoon", 6) 
   @room_array = [room1, room2, room3, room4]
  end

  def test_room_properties_from_array
    assert_equal( "Lizard Lounge", @room_array[0].name)
    assert_equal( 8, @room_array[1].capacity )
    assert_equal( [], @room_array[2].songs)
    assert_equal( [], @room_array[3].guests ) 
  end

end

  
