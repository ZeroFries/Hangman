require "test/unit"
require_relative "../Hangman.rb"

class Hangman_tests < Test::Unit::TestCase
	def setup
		@hm = Hangman.new
		@word = @hm.random_word
	end

	def test_random_word_is_a_string
		assert @word.is_a?(String)
	end	

end