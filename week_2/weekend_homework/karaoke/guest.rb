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

  def add_song_to_room(song_to_add)
    # binding.pry
    
  
  end


end