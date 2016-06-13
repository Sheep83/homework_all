require ('minitest/autorun')
require_relative('../river')
require_relative('../bears')
require_relative('../fish')


#testing for array of 3 fish, remove fish to bear tummy

class TestRiver < MiniTest::Test

  def setup
    @fish1 = Fish.new("Supper")
    @fish2 = Fish.new("Finlay")
    @fish3 = Fish.new("Gil")
    @river = River.new([@fish1, @fish2, @fish3])
    @bear1 = Bear.new("Sue", "Panda")
    @bear2 = Bear.new("Gummi", "Bi-Polar")
  end

  def test_fish_count
    assert_equal(3, @river.river_fish_count)
  end

  def test_fish_count_caught
    @bear1.bear_takes_fish(@river)
    assert_equal(2, @river.river_fish_count)
  end

  def test_empty_river
    # @river.river_dec_fish
    # @river.river_dec_fish
    # @river.river_dec_fish
    @river = River.new([])
    @bear1.bear_takes_fish(@river)
    assert_equal(0, @river.river_fish_count)
    assert_equal(0, @bear1.fish_in_tummy)
  end

end
#not sure why the last test fails, but it is caused by line 34 causing the bears tummy count to return as 1. 
#scratch that, just realised calling .pop on an empty array returns nil which is pushed to the tummy and returns 1. fixed :)
