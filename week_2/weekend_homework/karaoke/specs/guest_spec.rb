require 'pry-byebug'
require ('minitest/autorun')
require_relative ('../bar')
require_relative ('../song')
require_relative ('../room')

class TestGuest < Minitest::Test

  def setup
    guest1 = Guest.new("Brian", 500)
    guest2 = Guest.new("Lisa", 250)
    guest3 = Guest.new("Jaime", 100)
    guest4 = Guest.new("Amelia", 0) 
    @guest_array = [guest1, guest2, guest3, guest4] 
    # binding.pry
  end

  def test_guest_properties_from_array
    assert_equal( "Brian", @guest_array[0].name )
    assert_equal( 0, @guest_array[3].cash )
  end


end