require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../song')
require_relative ('../guest')
require_relative ('../room')
require_relative ('../bar')
require_relative ('../viewer')


class TestViewer < Minitest::Test

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
  
  @bar = Bar.new( @room_array, @song_array, @guest_array, 1000 )
  @viewer = Viewer.new( @bar )

  end

  def test_report_guests_in_bar
    assert_equal(4, @viewer.report_guests_in_bar)
  end

end