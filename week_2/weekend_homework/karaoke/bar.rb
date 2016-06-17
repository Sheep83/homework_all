
require 'pry-byebug'
require_relative('songs')
require_relative('rooms')
require_relative('guests')


class Bar
  attr_reader :rooms
  attr_reader :playlist
  
  def initialize(rooms, playlist)
  @playlist = playlist
  @rooms = rooms
  end


end


  

