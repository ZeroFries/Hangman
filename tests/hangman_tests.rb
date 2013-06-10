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

      def test_initial_chances_is_8
        assert_equal 8, @hm.chances
      end

      def test_initial_guesses_is_an_array
        assert @hm.guesses.is_a?(Array)
      end

      def test_initial_guesses_is_a_empty_array
        assert @hm.guesses.empty?
      end

      def test_incorrect_guess_in_the_array
        @hm.original_word = "pie"
        @hm.guess("l")
        assert @hm.guesses.include?("l")
      end

end
