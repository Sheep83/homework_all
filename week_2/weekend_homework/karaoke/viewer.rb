require 'pry-byebug'
require_relative('song')
require_relative('room')
require_relative('guest')
require_relative('bar')

class Viewer

  attr_reader :bar

  def initialize(bar)
    @bar = bar
  end

  def report_guests_in_bar
  return bar.guests.size
  end

  def welcome
    system("clear")
    print "Welcome to the Code Clan Caraoke Bar!."
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 1
    puts
  end

  def menu
    system("clear")
    puts "Please select an option..."
    puts "***************************"
    puts "1 - Add guest to room"
    puts "2 - Add song to room"
    puts "3 - Remove guest from room"
    puts "4 - Remove guest from bar"
    puts "5 - Guest cash balance"
    puts "6 - Bar cash balance"
    puts "7 - Current room occupancy"
    puts "***************************"
    puts
    puts "X - Exit"
  end

  def menu_guest_select
    system("clear")
    puts "Choose guest..."
    puts "1 - #{bar.guests[0].name}"
    puts "2 - #{bar.guests[1].name}"
    puts "3 - #{bar.guests[2].name}"
    puts "4 - #{bar.guests[3].name}"
  end


  def menu_song_select
    system("clear")
    puts "Choose song..."
    puts "1 - #{bar.songs[0].title} - #{bar.songs[0].artist}"
    puts "2 - #{bar.songs[1].title} - #{bar.songs[1].artist}"
    puts "3 - #{bar.songs[2].title} - #{bar.songs[2].artist}"
    puts "4 - #{bar.songs[3].title} - #{bar.songs[3].artist}"
  end

  def menu_room_select
    system("clear")
    puts "Choose room to add to..."
    puts "1 - #{bar.rooms[0].name}"
    puts "2 - #{bar.rooms[1].name}"
    puts "3 - #{bar.rooms[2].name}"
    puts "4 - #{bar.rooms[3].name}"
  end

  def report_guest_balance( guest )
    puts "#{guest.name} has #{guest.cash} remaining..."
    sleep 2
  end

  def report_bar_balance( bar )
    puts "Current cash in the bar till is #{bar.cash}..."
    sleep 2
  end

end


