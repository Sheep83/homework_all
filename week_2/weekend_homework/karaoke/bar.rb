
require 'pry-byebug'
require_relative('song')
require_relative('room')
require_relative('guest')


class Bar
  attr_accessor :rooms
  attr_accessor :songs
  
  def initialize(rooms, songs, guests)
    @rooms = rooms
    @songs = songs
    @guests = guests
  end
  
end


  

