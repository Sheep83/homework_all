require 'pry-byebug'
require_relative('bar')
require_relative('guests')
require_relative('songs')

class Room
  attr_reader :songs
  attr_reader :guests

  def initialize(songs, guests)
    @songs = songs
    @guests = guests
  end
end

