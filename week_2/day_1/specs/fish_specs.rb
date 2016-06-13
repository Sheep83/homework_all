require ('minitest/autorun')
require_relative('../fish')
require_relative('../river')
require_relative('../bears')


#testing for create fish


class TestFish < MiniTest::Test

  def setup
    @bear1 = Bear.new("Sue", "Panda")
    @bear2 = Bear.new("Gummi", "Polar")
    @fish1 = Fish.new("Supper")
    @fish2 = Fish.new("Finlay")
    @fish3 = Fish.new("Gil")
    @river = River.new([@fish1, @fish2, @fish3])
  end

  def test_fish_name
    assert_equal("Supper", @fish1.name)
    assert_equal("Finlay", @fish2.name)
    assert_equal("Gil", @fish3.name)
  end


end
