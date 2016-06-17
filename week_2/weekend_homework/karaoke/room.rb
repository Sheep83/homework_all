require 'pry-byebug'
require_relative('bar')
require_relative('guest')
require_relative('song')

class Room
  attr_reader :name
  attr_reader :capacity
  attr_reader :songs
  attr_reader :guests


  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @songs = Array.new
    @guests = Array.new
  end

end

