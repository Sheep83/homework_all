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
   @rooms = [room1, room2, room3, room4]
   # binding.pry   
  end

  def test_room_properties_from_array
    assert_equal( "Lizard Lounge", @rooms[0].name)
    assert_equal( 8, @rooms[1].capacity )
    assert_equal( [], @rooms[2].songs)
    assert_equal( [], @rooms[3].guests ) 
  end

end

  
