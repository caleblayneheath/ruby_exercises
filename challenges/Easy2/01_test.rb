require 'minitest/autorun'
require_relative '01_odd_words.rb'

class OddWordsTest < Minitest::Test

  def test_simple_odd_words
    string = 'whats the matter with kansas.'
    result = 'whats eht matter htiw kansas.'
    assert_equal(string.odd_words, result)
  end

  def test_multiple_spaces
    string = '   whats     the matter    with   kansas   .'
    result = 'whats eht matter htiw kansas.'
    assert_equal(string.odd_words, result)
  end

  def test_one_word
    string = 'whats.'
    result = 'whats.'
    assert_equal(string.odd_words, result)
  end

  def test_empty
    string = ''
    result = ''
    assert_equal(string.odd_words, result)
  end

  def test_only_dots
    string = '.....   ...'
    result = ''
    assert_equal(string.odd_words, result)
  end

end