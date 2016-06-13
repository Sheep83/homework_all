#bear class
class Bear
  
  attr_accessor :tummy
  attr_accessor :name
  attr_accessor :type

  def initialize(name, type)
      @name = name
      @type = type
      @tummy = []
  end

  def roar
    return "#{@name} roars ferociously!"
  end

  def bear_takes_fish(river)
    caught_fish = river.river_dec_fish
    if caught_fish != nil
    @tummy << caught_fish
    end
  end

  def fish_in_tummy
    return @tummy.size
  end

end