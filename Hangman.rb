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
		words.sample #randomly select a word
	end

	def guess_letter(guess)
	  if original_word.include?(guess)
        @word.count(guess).times do
       	slate[@word.index(guess)] = guess
       	@word = word.sub(guess, ' ') # note: can't use sub! because this modifies the origin object, thus modifing original_word
      end
      else
     	guesses << guess
     	@chances -= 1
	  end
	end

	def win?
		slate.join('') == original_word
	end

	def lose?
		chances == 0
	end
end

