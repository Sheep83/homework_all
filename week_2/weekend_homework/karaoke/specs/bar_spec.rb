require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../songs')

class TestBar < Minitest::Test

  def setup
    @playlist = [{"artist1" => "title1"}, {"artist2" => "title_2"}]
    @bar = Bar.new([], @playlist) 
  end
  
  def test_can_select_song
    # binding.pry
    result = @bar.playlist[0]
    # binding.pry
    assert_equal({"artist1" => "title1"} , result)    
  end

end



