require './Hangman'

class Runner
  def initialize
  	hm = Hangman.new

		loop do
	  	break if hm.win?
	  	break if hm.lose?
	  	output(hm.slate, hm.chances, hm)
	  	guess = gets[0].downcase

	  	while (hm.guesses.include?(guess) || hm.slate.include?(guess)) #loops until person has fresh guess
	  		puts "You have already guessed that! Guess again:"
	  		guess = gets[0].downcase
	  	end
	    while !("a".."z").include?(guess)
	    	puts "You have to guess a letter! Guess again:"
	    	guess = gets[0].downcase
	    end

	    hm.guess_letter(guess)
		end

		puts "     " + hm.slate.join(' ')
		puts "YOU WIN!!" if hm.win?
		puts "YOU LOSE! The word was \'#{hm.original_word}\'. Try again?" if hm.lose?
	end

	def output(slate,chances, hm)
		print "-------------------------------------------------------\n", "     "
		hm.slate.each { |c| print c, " " }
    puts "\n     You have #{hm.chances} chances left"
    print "     Guesses: "
    hm.guesses.each { |c| print c, " " }
    puts "\nWhat's your guess?"
	end
end

Runner.new
