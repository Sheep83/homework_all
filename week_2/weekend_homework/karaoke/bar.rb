
require 'pry-byebug'
require_relative('song')
require_relative('room')
require_relative('guest')


class Bar
  attr_accessor :rooms
  attr_accessor :songs
  attr_accessor :guests
  attr_accessor :cash

  def initialize(rooms, songs, guests, cash)
    @rooms = rooms
    @songs = songs
    @guests = guests
    @cash = cash
  end

  def add_guest_to_room(guest, room)
      room.guests.push(guest)
  end

  def remove_guest_from_room(guest, room)
      room.guests.each do |x|
        if x.name == guest.name
          room.guests.delete(x)
        end
        end
  end      

end


  

