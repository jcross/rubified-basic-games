#!/usr/bin/env ruby

# A Buzzword generator based on the BASIC version by David Ahl
# found on page 36 of David H. Ahl's BASIC Computer Games, 1978.
# Ruby translation by James Cross (http://github.com/jcross/)

module Buzzword
  FIRST_BUZZWORDS = %w(ABILITY BASAL BEHAVIORAL CHILD-CENTERED DIFFERENTIATED
                       DISCOVERY FLEXIBLE HETEROGENOUS HOMOGENOUS MANIPULATIVE
                       MODULAR TAVISTOCK INDIVIDUALIZED)
  SECOND_BUZZWORDS = %w(LEARNING EVALUATIVE OBJECTIVE COGNITIVE ENRICHMENT
                        SCHEDULING HUMANISTIC INTEGRATED NON-GRADED TRAINING
                        VERTICAL\ AGE MOTIVATIONAL CREATIVE)
  THIRD_BUZZWORDS = %w(GROUPING MODIFICATION ACCOUNTABILITY PROCESS 
                       CORE\ CURRICULUM ALGORITHM PERFORMANCE REINFORCEMENT
                       OPEN\ CLASSROOM RESOURCE STRUCTURE FACILITY ENVIRONMENT)

  def self.display_intro
    puts "BUZZWORD GENERATOR".center(80)
    puts "CREATIVE COMPUTING  MORRISTOWN, NEW JERSEY".center(80)
    puts "TRANSLATED TO RUBY".center(80)
    puts "BY JAMES CROSS (http://github.com/jcross/)".center(80)
    puts "\n\n\n"

    puts "THIS PROGRAM PRINTS HIGHLY ACCEPTABLE PHRASES IN"
    puts "'EDUCATOR-SPEAK' THAT YOU CAN WORK INTO REPORTS"
    puts "AND SPEECHES.  WHENEVER A QUESTION MARK IS PRINTED,"
    puts "TYPE A 'Y' FOR ANOTHER PHRASE OR 'N' TO QUIT.\n\n\n"
  end

  def self.main
    input = "Y"
    puts "HERE'S THE FIRST PHRASE:"
    while input.upcase.start_with? "Y"
      [FIRST_BUZZWORDS, SECOND_BUZZWORDS, THIRD_BUZZWORDS].each do |bwords|
        print bwords[rand(1..bwords.length) - 1], " "
      end
      print "\n\n? "
      input = gets
    end

    puts "COME BACK WHEN YOU NEED HELP WITH ANOTHER REPORT!"
  end

  def self.run
    display_intro
    main
  end
end

if __FILE__ == $PROGRAM_NAME
  Buzzword.run
end