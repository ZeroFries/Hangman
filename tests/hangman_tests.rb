require "test/unit"
require_relative "../Hangman.rb"

class Hangman_tests < Test::Unit::TestCase
  def setup_guess
    @hm.original_word = "pie"
    @hm.word = "pie"
    @hm.slate = ["_", "_", "_"]
  end

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

  def test_reducing_chances
    @hm.chances-= 1
    assert_equal 7, @hm.chances
  end

  def test_initial_guesses_is_an_array
    assert @hm.guesses.is_a?(Array)
  end

  def test_initial_guesses_is_a_empty_array
    assert @hm.guesses.empty?
  end

  def test_incorrect_guess_in_the_array_and_reduces_chances
    setup_guess
    @hm.word = "pie"
    @hm.guess_letter("l")
    assert @hm.guesses.include?("l")
    assert_equal @hm.chances, 7
  end

  def test_correct_guess_adds_to_slate
    setup_guess
    @hm.guess_letter("p")
    assert @hm.slate.include?("p")
  end

  def test_win
    setup_guess
    @hm.guess_letter("p")
    @hm.guess_letter("i")
    @hm.guess_letter("e")
    assert @hm.win?
  end

  def test_lose
    @hm.chances = 0
    assert @hm.lose?
  end
end
