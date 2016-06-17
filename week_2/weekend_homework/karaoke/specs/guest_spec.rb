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
    @guests = [guest1, guest2, guest3, guest4] 
    # binding.pry
  end

  def test_guest_name_from_array
    assert_equal( "Brian", @guests[0].name )
  end

  def test_guest_cash_from_array
    assert_equal( 500, @guests[0].cash )
  end


end