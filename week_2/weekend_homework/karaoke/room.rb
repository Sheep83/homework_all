require 'pry-byebug'
require_relative('bar')
require_relative('guest')
require_relative('song')

class Room
  attr_reader :name
  attr_reader :capacity
  attr_accessor :songs
  attr_accessor :guests
  attr_reader :fee


  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @songs = Array.new
    @guests = Array.new
    @fee = 20
  end

end

