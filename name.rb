#!/usr/bin/env ruby

# A little program that asks for the user's name and deliberately mangles it.
# Based on the BASIC version by Geoffrey Chase found on page 116 of 
# David H. Ahl's BASIC Computer Games, 1978.
# Ruby translation by James Cross (http://github.com/jcross/)

module Name
  def self.display_intro
    puts "NAME".center(80)
    puts "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY".center(80)
    puts "TRANSLATED TO RUBY".center(80)
    puts "BY JAMES CROSS (http://github.com/jcross/)".center(80)
  end

  def self.get_name
    puts "\n\n\nHELLO."
    puts "MY NAME IS CREATIVE COMPUTER."
    print "WHAT'S YOUR NAME (FIRST AND LAST)? "
    gets.chomp.upcase
  end

  def self.reverse_name(name)
    puts
    print "THANK YOU, "
    # Added a little slowness for effect.
    name.reverse.split('').each do |c|
      sleep(0.1)
      print c
    end
    puts "."
    puts "OOPS!  I GUESS I GOT IT BACKWARDS.  A SMART"
    puts "COMPUTER LIKE ME SHOULDN'T MAKE A MISTAKE LIKE THAT!"
  end

  def self.sort_name(name)
    puts
    puts "BUT I JUST NOTICED YOUR LETTERS ARE OUT OF ORDER."
    print "LET'S PUT THEM IN ORDER LIKE THIS: "
    # More slowness for effect.
    name.split('').sort.each do |c|
      sleep(0.1)
      print c
    end
    puts "\n\n"
    print "DON'T YOU LIKE THAT BETTER? "
    input = gets.chomp.upcase
    puts
    if input.start_with? "Y"
      puts "I KNEW YOU'D AGREE!!"
    else
      puts "I'M SORRY YOU DON'T LIKE IT THAT WAY."
    end
  end

  def self.goodbye(name)
    puts
    puts "I REALLY ENJOYED MEETING YOU #{name}."
    puts "HAVE A NICE DAY!"
  end

  def self.main
    name = get_name
    reverse_name(name)
    sort_name(name)
    goodbye(name)
  end

  def self.run
    display_intro
    main
  end
end

if __FILE__ == $PROGRAM_NAME
  Name.run
end