#main prograam

require 'pry-byebug'
require_relative('song')
require_relative('room')
require_relative('guest')
require_relative('bar')
require_relative('viewer')


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

class Open 
  
  attr_accessor :selected_guest
  attr_accessor :selected_song
  attr_accessor :selected_room

  def initialize ( bar, viewer, rooms, songs )
    @selected_guest = 0
    @selected_song = 0
    @selected_room = 0
  end

end

#define menu procedures
guest_select = proc {
choice = gets.chomp
case when choice == "1"
@selected_guest = @bar.guests[0]
end
case when choice == "2"
@selected_guest = @bar.guests[1]
end
case when choice == "3"
@selected_guest = @bar.guests[2]
end
case when choice == "4"
@selected_guest = @bar.guests[3]
end}
#############################################################
room_select = proc {
choice = gets.chomp
case when choice == "1"
@selected_room = @bar.rooms[0]
# binding.pry
end
case when choice == "2"
@selected_room = @bar.rooms[1]
end
case when choice == "3"
@selected_room = @bar.rooms[2]
end
case when choice == "4"
@selected_room = @bar.rooms[3]
end}
#############################################################
song_select = proc {
choice = gets.chomp
case when choice == "1"
@selected_song = @bar.songs[0]
end
case when choice == "2"
@selected_song = @bar.songs[1]
end
case when choice == "3"
@selected_song = @bar.songs[2]
end
case when choice == "4"
@selected_song = @bar.songs[3]
end}

#############################################################
#main program start
#############################################################

@open_bar = Open.new(@bar, @viewer, @room_array, @song_array)

@viewer.welcome
loop do
binding.pry
@viewer.menu
main_menu_choice = gets.chomp
  case when main_menu_choice == "1"
  @viewer.menu_guest_select
  guest_select.call
  @viewer.menu_room_select
  room_select.call
  @bar.add_guest_to_room(@selected_guest, @selected_room, @bar)
  end
  case when main_menu_choice == "2"
  @viewer.menu_song_select
  song_select.call
  @viewer.menu_room_select
  room_select.call
  @bar.add_song_to_room(@selected_song, @selected_room, @bar)
  end
  case when main_menu_choice == "3"
  @viewer.menu_guest_select
  guest_select.call
  @viewer.menu_room_select
  room_select.call
  @bar.remove_guest_from_room(@selected_guest, @selected_room,)
  end
  case when main_menu_choice == "4"
  @viewer.menu_guest_select
  guest_select.call
  @bar.remove_guest_from_bar(@selected_guest, @bar)
  end
  case when main_menu_choice == "x"
  break
  end
end
  
  


  # if gets.chomp == "1"
  #   @selected_guest = @bar.guests[0]
  #   @viewer.menu_room_select
  #   gets.chomp
  #   if gets.chomp == "1"
  #     @selected_room = @bar.rooms[0]
  #     @bar.add_guest_to_room(@selected_guest, @selected_room, @bar)
  #   elsif gets.chomp == "2"
  #     @selected_room = @bar.rooms[1]
  #   elsif gets.chomp == "3"
  #     @selected_room = @bar.rooms[2]
  #   elsif gets.chomp == "4"
  #     @selected_room = @bar.rooms[3]
  #   end
  # elsif gets.chomp == "2"
  #   @selected_guest = @bar.guests[1]
  #   @viewer.menu_room_select
  #   gets.chomp
  #   if gets.chomp == "1"
  #     @selected_room = @bar.rooms[0]
  #     @bar.add_guest_to_room(@selected_guest, @selected_room, @bar)
  #   elsif gets.chomp == "2"
  #     @selected_room = @bar.rooms[1]
  #   elsif gets.chomp == "3"
  #     @selected_room = @bar.rooms[2]
  #   elsif gets.chomp == "4"
  #     @selected_room = @bar.rooms[3]
  #   end
  # elsif gets.chomp == "3"
  #   @selected_guest = @bar.guests[2]
  #   @viewer.menu_room_select
  #   gets.chomp
  #   if gets.chomp == "1"
  #     @selected_room = @bar.rooms[0]
  #     @bar.add_guest_to_room(@selected_guest, @selected_room, @bar)
  #   elsif gets.chomp == "2"
  #     @selected_room = @bar.rooms[1]
  #   elsif gets.chomp == "3"
  #     @selected_room = @bar.rooms[2]
  #   elsif gets.chomp == "4"
  #     @selected_room = @bar.rooms[3]
  #   end
  # elsif gets.chomp == "4"
  #   @selected_guest = @bar.guests[3]
  #   @viewer.menu_room_select
  #   gets.chomp
  #   if gets.chomp == "1"
  #     @selected_room = @bar.rooms[0]
  #     @bar.add_guest_to_room(@selected_guest, @selected_room, @bar)
  #   elsif gets.chomp == "2"
  #     @selected_room = @bar.rooms[1]
  #   elsif gets.chomp == "3"
  #     @selected_room = @bar.rooms[2]
  #   elsif gets.chomp == "4"
  #     @selected_room = @bar.rooms[3]
  #   end
  # end
# end
# elsif gets.chomp = "2"
#   @viewer.menu_song_select




