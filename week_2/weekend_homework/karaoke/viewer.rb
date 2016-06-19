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
    print "Loading,"
    sleep 1
    print "."
    sleep 1
    print "."
    sleep 1
    puts
    puts "Welcome to the CodeClan Caraoke Bar!"
    sleep 2
  end

  def menu
    system("clear")
    puts "Please select an option..."
    puts
    puts "*****************************"
    puts " 1 - Add guest to room"
    puts " 2 - Add song to room"
    puts " 3 - Remove guest from room"
    puts " 4 - Remove guest from bar"
    puts " 5 - Guest cash balance"
    puts " 6 - Bar cash balance"
    puts " 7 - Current room occupancy"
    puts "*****************************"
    puts
    puts "X - Exit"
  end

  def menu_guest_select
    system("clear")
    puts "Choose guest..."
    count = 0
    bar.guests.each do |guest|
      puts "#{count += 1} - #{guest.name}"
    end
  end


  def menu_song_select
    system("clear")
    puts "Choose song..."
    count = 0
    bar.songs.each do |song|
      puts "#{count += 1} - #{song.title} by #{song.artist}"
    end
  end

  def menu_room_select
    system("clear")
    puts "Choose room to add to..."
    count = 0
    bar.rooms.each do |room|
      puts "#{count += 1} - #{room.name}"
    end
  end

  def report_guest_balance( guest )
    puts "#{guest.name} has #{guest.cash} remaining..."
    sleep 2
  end

  def report_bar_balance( bar )
    system("clear")
    puts "Current cash in the bar till is #{bar.cash}..."
    sleep 2
  end

  def report_room_status( room )
    system("clear")
    puts "Room - #{room.name}"
    sleep 1
    puts "Current guests - "
    room.guests.each do |guest|
      puts "#{guest.name}"
    end
    sleep 2
    puts "Current songs - "
    room.songs.each do |song|
      puts "#{song.title} by #{song.artist}"
      sleep 2
    end
  end

end


