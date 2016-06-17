require 'pry-byebug'
require_relative('bar')
require_relative('room')
require_relative('song')

class Guest
  attr_accessor :name
  attr_accessor :cash

  def initialize(name, cash)
    @name = name
    @cash = cash
  end

  def add_song_to_room(song, room)
    # binding.pry
    room.songs.push(song)
  end


end