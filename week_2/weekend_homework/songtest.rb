class Song
  attr_reader :artist
  attr_reader :title


  def initialize(artist, title)
    @artist = artist
    @title = title
  end

end
song1 = Song.new("artist1", "title1")
song2 = Song.new("artist2", "title2")
puts song1.artist
puts song1.title
puts song2.artist
puts song2.title

