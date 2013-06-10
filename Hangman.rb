class Hangman
	attr_accessor :guesses, :original_word, :chances, :slate, :word

	def initialize
		@chances = 8
		@guesses = []
		@slate = []
		@original_word = random_word
		@word = @original_word
		@original_word.length.times { @slate << "_" }
	end

	def random_word
		words = "Many biological processes involve the conversion of energy into forms that are usable for chemical transformations and are quantum mechanical in nature Such processes involve chemical reactions light absorption formation of excited electronic states transfer of excitation energy and the transfer of electrons and protons hydrogen ions in chemical processes such as photosynthesis and cellular respiration".downcase.split(' ')
		word = words.sample #randomly select a word
	end

	def guess_letter(guess)
		while (guesses.include?(guess) || slate.include?(guess)) #loops until person has fresh guess
	  	puts "You have already guessed that! Guess again:"
	  	guess = gets[0].downcase
	  end
	  while !("a".."z").include?(guess)
	    puts "You have to guess a letter! Guess again:"
	    guess = gets[0].downcase
	  end

	  if slate.include?(guess)
      word.count(guess).times do
       	slate[word.index(guess)] = guess
       	word = word.sub(guess, ' ') # note: can't use sub! because this modifies the origin object, thus modifing original_word
      end
    else
     	guesses << guess
     	@chances -= 1
	  end
	end

	def win?(slate)
		slate.join('') == original_word
	end

	def lose?(chances)
		chances == 0
	end

	def output(slate,chances)
		print "-------------------------------------------------------\n", "     "
		slate.each { |c| print c, " " }
    puts "\n     You have #{chances} chances left"
    print "     Guesses: "
    guesses.each { |c| print c, " " }
    puts "\nWhat's your guess?"
	end
end

