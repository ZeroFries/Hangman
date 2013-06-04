class Hangman
	attr_accessor :guesses

	def random_word
		words = "Many biological processes involve the conversion of energy into forms that are usable for chemical transformations and are quantum mechanical in nature. Such processes involve chemical reactions, light absorption, formation of excited electronic states, transfer of excitation energy, and the transfer of electrons and protons (hydrogen ions) in chemical processes such as photosynthesis and cellular respiration".split(' ')
		word = words.shuffle.first #randomly select a word
	end

	def win?(slate,word)
		slate.join('') == word
	end

	def lose?(chances)
		chances == 0
	end

	def output(slate,chances)
		slate.each { |c| print c, " " }
    puts "You have #{chances} chances left"
    print "Guesses: ", guesses.each { |c| print c, " " }
    puts "What's your guess?"
	end

  def intialize
  	puts "hi"
  	@guesses = []
  	chances = 8
  	word = random_word
		slate = []
		slate = word.length.times { slate << "_" }
		puts word
		puts chances

		loop do 
	  	break if win?(slate,word)
	  	break if lose?(chances)
	  	output(slate, chances)
	  	gets
		end
	end
end

Hangman.new

