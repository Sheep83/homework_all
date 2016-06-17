
require 'pry-byebug'
require_relative('bar')
require_relative('guests')
require_relative('rooms')

class Song
  attr_reader :artist
  attr_reader :title


  def initialize(artist, title)
    @artist = artist
    @title = title
  end

end
