#river class
class River

  def initialize(fish)
    @fish = fish
  end

  def river_dec_fish
    @fish.pop
  end

  def river_fish_count
    return @fish.size
  end

end