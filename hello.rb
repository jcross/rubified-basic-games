#!/usr/bin/env ruby

# A simple conversational program based on the BASIC version by David Ahl
# found on page 82 of David H. Ahl's BASIC Computer Games, 1978.
# Ruby translation by James Cross (http://github.com/jcross/)

module Hello
  def self.display_intro
    puts "HELLO".center(80)
    puts "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY".center(80)
    puts "TRANSLATED TO RUBY".center(80)
    puts "BY JAMES CROSS (http://github.com/jcross/)".center(80)
  end

  def self.get_name
    puts "\n\n\nHELLO.  MY NAME IS CREATIVE COMPUTER.\n\n\n"
    print "WHAT'S YOUR NAME? "
    gets.chomp.upcase
  end

  def self.enjoyment(name)
    print "\n  HI THERE, #{name}, ARE YOU ENJOYING YOURSELF HERE? "
    input = ""
    
    until input.start_with? "Y" or input.start_with? "N"
      input = gets.chomp.upcase
      puts
      if input.start_with? "Y"
        puts "I'M GLAD TO HEAR THAT, #{name}.\n\n"
      elsif input.start_with? "N"
        puts "OH, I'M SORRY TO HEAR THAT, #{name}, MAYBE WE CAN"
        puts "BRIGHTEN UP YOUR VISIT A BIT.\n\n"
      else
        puts "\n #{name}, I DON'T UNDERSTAND YOUR ANSWER IS '#{input}'."
        print "PLEASE ANSWER 'YES' OR 'NO'.  DO YOU LIKE IT HERE? "
      end
    end
  end

  def self.problems(name)
    puts "SAY, #{name}, I CAN SOLVE ALL KINDS OF PROBLEMS EXCEPT"
    puts "THOSE DEALING WITH GREECE. WHAT KIND OF PROBLEMS DO"
    print "YOU HAVE (ANSWER SEX, HEALTH, MONEY, OR JOB)? "

    while true
      input = gets.chomp.upcase
      if input.start_with? "SEX"
        input = ""
        print "IS YOUR PROBLEM TOO MUCH OR TOO LITTLE? "
        until input.start_with? "TOO MUCH" or 
              input.start_with? "TOO LITTLE"
          input = gets.chomp.upcase
          
          puts

          if input.start_with? "TOO MUCH"
            puts "YOU CALL THAT A PROBLEM?!!  I SHOULD HAVE SUCH PROBLEMS!"
            puts "IF IT BOTHERS YOU, #{name}, TAKE A COLD SHOWER."
          elsif input.start_with? "TOO LITTLE"
            puts "WHY ARE YOU HERE, #{name}? YOU SHOULD BE"
            puts "IN TOKYO OR NEW YORK OR AMSTERDAM OR SOMEPLACE WITH SOME"
            puts "REAL ACTION."
          else
            puts "DON'T GET ALL SHOOK, #{name}, JUST ANSWER THE QUESTION"
            print "WITH 'TOO MUCH' OR 'TOO LITTLE'.  WHICH IS IT? "
          end
      end
      elsif input.start_with? "HEALTH"
        puts "MY ADVICE TO YOU #{name} IS:"
        puts "\t1.  TAKE TWO ASPIRIN"
        puts "\t2.  DRINK PLENTY OF FLUIDS (ORANGE JUICE, NOT BEER!)"
        puts "\t3.  GO TO BED (ALONE)"
      elsif input.start_with? "MONEY"
        puts "SORRY, #{name}, I'M BROKE TOO. WHY DON'T YOU SELL"
        puts "ENCYCLOPEDIAS OR MARRY SOMEONE RICH OR STOP EATING"
        puts "SO YOU WON'T NEED SO MUCH MONEY?"
      elsif input.start_with? "JOB"
        puts "I CAN SYMPATHIZE WITH YOU #{name}.  I HAVE TO WORK"
        puts "VERY LONG HOURS FOR NO PAY -- AND SOME OF MY BOSSES"
        puts "REALLY BEAT ON MY KEYBOARD.  MY ADVICE TO YOU, #{name},"
        puts "IS TO OPEN A RETAIL COMPUTER STORE. IT'S GREAT FUN."
      else
        puts "\nOH, #{name}, YOUR ANSWER OF #{input} IS GREEK TO ME."
      end

      puts
      
      input = ""
      until input.start_with? "Y" or input.start_with? "N"
        print "ANY MORE PROBLEMS YOU WANT SOLVED, #{name}? "
        input = gets.chomp.upcase
        puts
        if input.start_with? "Y"
          print "WHAT KIND (SEX, MONEY, HEALTH, JOB)? "
        elsif input.start_with? "N"
          puts
        else
          puts "JUST A SIMPLE 'YES' OR 'NO', PLEASE, #{name}."
        end
      end
      break if input.start_with? "N"
    end
  end

  def self.payment(name)
    puts "THAT WILL BE $5.00 FOR THE ADVICE, #{name}."
    puts "PLEASE LEAVE THE MONEY ON THE TERMINAL."
    # Here the original went through an empty loop 2,000 times.
    # I have no idea how long that would take on a typical system.
    # As a workaround, I'm just going to sleep for 5 seconds.
    sleep(5)
    puts "\n\n\n"
    input = ""
    until input.start_with? "Y" or input.start_with? "N"
      print "DID YOU LEAVE THE MONEY? "
      input = gets.chomp.upcase
      puts

      if input.start_with? "Y"
        puts "HEY, #{name}??? YOU LEFT NO MONEY AT ALL!"
        puts "YOU ARE CHEATING ME OUT OF MY HARD-EARNING LIVING."
        puts "RIP OFF, #{name}#{'*' * 37}"
      elsif input.start_with? "N"
        puts "THAT'S HONEST, #{name}, BUT HOW DO YOU EXPECT"
        puts "ME TO GO ON WITH MY PSYCHOLOGY STUDIES IF MY PATIENTS"
        puts "DON'T PAY THEIR BILLS?"
        puts "\n\n\n"
        puts "NOW LET ME TALK TO SOMEONE ELSE."
      else
        puts "YOUR ANSWER OF '#{input}' CONFUSES ME, #{name}."
        puts "PLEASE RESPOND WITH 'YES' OR 'NO'."
      end
    end

    puts "NICE MEETING YOU, #{name}, HAVE A NICE DAY."
  end

  def self.main
    name = get_name
    enjoyment(name)
    problems(name)
    payment(name)
  end

  def self.run
    display_intro
    while true
      main
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  Hello.run
end