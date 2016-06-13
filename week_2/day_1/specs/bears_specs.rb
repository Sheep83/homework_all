require ('minitest/autorun')
require_relative('../bears')
require_relative('../river')
require_relative('../fish')


#testing for roar(string), take fish (from river), increase fish (in tummy)


class TestBears < MiniTest::Test

  def setup
    @bear1 = Bear.new("Sue", "Panda")
    @bear2 = Bear.new("Gummi", "Polar")
    @fish1 = Fish.new("Supper")
    @fish2 = Fish.new("Finlay")
    @fish3 = Fish.new("Gil")
    @river = River.new([@fish1, @fish2, @fish3])
  end

  def test_roar
    assert_equal("Sue roars ferociously!", @bear1.roar)
    assert_equal("Gummi roars ferociously!", @bear2.roar)

  end

  def test_bear_takes_fish
    @bear1.bear_takes_fish(@river)
    assert_equal(1, @bear1.fish_in_tummy)
  end

  def test_report_bear_name_and_type
    assert_equal("Sue", @bear1.name)
    assert_equal("Gummi", @bear2.name)
    assert_equal("Panda", @bear1.type)
    assert_equal("Polar", @bear2.type)
  end

end