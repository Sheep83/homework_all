
require 'pry-byebug'
require_relative('song')
require_relative('room')
require_relative('guest')


class Bar < Guest
  attr_accessor :rooms
  attr_accessor :songs
  attr_accessor :guests
  attr_accessor :cash

  def initialize( rooms, songs, guests, cash )
    @rooms = rooms
    @songs = songs
    @guests = guests
    @cash = cash
  end

  def add_guest_to_room( guest, room, bar )
      # binding.pry
      unless room.guests.size == room.capacity || guest.cash < room.fee
        room.guests.push(guest)
        guest.cash -= room.fee
        bar.cash += room.fee
      end
  end

  def remove_guest_from_room( guest, room )
      room.guests.delete(guest)
  end 

  def remove_guest_from_bar( guest, bar )
      bar.guests.delete(guest)
  end    

  def add_song_to_room( song, room, bar )
      # binding.pry
      room.songs.push(song)
  end

  def obtain_guest_balance( guest )
    return guest.cash
  end

end


  

