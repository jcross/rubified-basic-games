#!/usr/bin/env ruby

# A version of the card game Acey Deucey based on the BASIC version by Bill Palmby
# found on page 2 of David H. Ahl's BASIC Computer Games, 1978.
# Ruby translation by James Cross (http://github.com/jcross/)

module AceyDucey
  CARD_FACE = { 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7",
                8 => "8", 9 => "9", 10 => "10", 11 => "JACK", 12 => "QUEEN",
                13 => "KING", 14 => "ACE" }

  def self.display_intro
    puts "ACEY DUCEY CARD GAME".center(80)
    puts "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY".center(80)
    puts "TRANSLATED TO RUBY".center(80)
    puts "BY JAMES CROSS (http://github.com/jcross/)\n\n\n".center(80)

    puts "ACEY-DUCEY IS PLAYED IN THE FOLLOWING MANNER"
    puts "THE DEALER (COMPUTER) DEALS TWO CARDS FACE UP"
    puts "YOU HAVE AN OPTION TO BET OR NOT BET DEPENDING"
    puts "ON WHETHER OR NOT YOU FEEL THE CARD WILL HAVE" # "nor" for "not" typo
    puts "A VALUE BETWEEN THE FIRST TWO."
    puts "IF YOU DO NOT WANT TO BET, INPUT A 0"
    puts "TO QUIT, INPUT QUIT"
  end

  def self.generate_card
    rand(2..14)
  end

  def self.generate_cards
    first = 14
    second = 0
    until first < second
      first = generate_card
      second = generate_card
    end
    return first, second
  end

  def self.main
    money = 100

    # This bit is duplicated below because we need to see this line at
    # startup but not after a $0 bet resulting in "CHICKEN!!!"
    puts "YOU NOW HAVE  #{money}  DOLLARS\n\n"
    
    while true
      first_card, second_card = generate_cards
      puts "HERE ARE YOUR NEXT TWO CARDS"
      puts " #{CARD_FACE[first_card]}\n #{CARD_FACE[second_card]}\n\n"
      print "WHAT IS YOUR BET? "
      input = gets.chomp
      break if input.upcase == "QUIT"
      input = input.to_i
      if input <= 0
        puts "CHICKEN!!\n\n"
      elsif input > money
        puts "SORRY, MY FRIEND BUT YOU BET TOO MUCH"
        puts "YOU HAVE ONLY  #{money}  DOLLARS TO BET\n\n"
      else
        third_card = generate_card
        puts " #{CARD_FACE[third_card]}"
        if third_card > first_card and third_card < second_card
          puts "YOU WIN!!!"
          money += input
        else
          puts "SORRY, YOU LOSE"
          money -= input
        end
        
        if money <= 0
          puts "SORRY, FRIEND BUT YOU BLEW YOUR WAD"
          print "TRY AGAIN (YES OR NO) "
          input = gets.chomp.upcase
          if input.start_with? "Y"
            money = 100
          else
            break
          end
        end

        puts "YOU NOW HAVE  #{money}  DOLLARS\n\n"
      end
    end
    
    puts "OK HOPE YOU HAD FUN"
  end

  def self.run
    display_intro
    main
  end
end

if __FILE__ == $PROGRAM_NAME
  AceyDucey.run
end