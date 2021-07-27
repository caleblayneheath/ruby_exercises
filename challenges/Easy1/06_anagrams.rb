=begin
Anagram is initialized withs tring

match
input: array of strings(words)
output: array containing anagrams in input, or empty if none

duplicates of initial string don't count
anagrams are case insensitve but must be recorded as original

algorithm,
  create empty results array
  created downcased sorted version of string
  for each possible anagram
    first, check if possible is eqaul to string, ignore if so
    second, check to see if possible is already in results

    
      also repeats in method input?
    next, compare downcased sorted version of string and possible
    if equal, add original possible to results.
  return results
=end

class Anagram
  attr_reader :string

  def initialize(string)
    @string = string
  end

  def match(possibles)
    comparison_string = string.downcase.chars.sort
    possibles.select do |elem|
      elem_compare = elem.downcase.chars.sort
      comparison_string == elem_compare && 
      string.downcase != elem.downcase
    end
  end

  # def match(possibles)
  #   results = []
  #   comparison_string = string.downcase.chars.sort
  #   possibles.each do |elem|
  #     elem_compare = elem.downcase.chars.sort
  #     if elem.downcase == string.downcase 
  #       next
  #     elsif comparison_string == elem_compare
  #       results << elem
  #     end
  #   end
  #   results
  # end
end