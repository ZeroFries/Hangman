class Hangman
	attr_accessor :guesses, :original_word, :chances

	def initialize
		@chances = 8
		@guesses = []
	end

	def random_word
		words = "Many biological processes involve the conversion of energy into forms that are usable for chemical transformations and are quantum mechanical in nature Such processes involve chemical reactions light absorption formation of excited electronic states transfer of excitation energy and the transfer of electrons and protons hydrogen ions in chemical processes such as photosynthesis and cellular respiration".downcase.split(' ')
		word = words.sample #randomly select a word
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

