=begin
ignore punctuation in words, EXCEPT QUOTE MARKS ARE DIFF
  punctuation is !&@$%^& (also . maybe?)
split by spaces, commas
handles line breaks
  maybe sub out all whitespace chars?
numbers are part of words
all cases should be normalised(downcase)
words with apostrophes are one word
words in quotes are fine and should not be considred in quotes

=end

class Phrase  
  def initialize(phrase)
    @phrase = phrase
    process_tokens
  end

  def process_tokens
    @tokens = @phrase.downcase.scan(/'?\w+'?\w*/)
    @tokens.map! do |elem| 
      if elem.count("'") == 2
        elem.gsub("'", '')
      else
        elem
      end
    end
    @tokens.delete('')
  end

  def word_count
    @tokens.uniq.each_with_object(Hash.new) do |elem, count|
      count[elem] = @tokens.count(elem) 
    end
  end
end


# class Phrase
#   def initialize(phrase)
#     @phrase = phrase
#     # @tokens = @phrase.split(/[\s,]/).map{ |word| word.gsub(/[!&@$%^&:.\n]/, '')}
#     @tokens = @phrase.split(/[\s,]/).map{ |word| word.gsub(/[^'a-zA-Z0-9]|^'|'$/, '')}
#     @tokens.reject! { |elem| elem == '' }
#   end

#   def word_count
#     count = {}
#     @tokens.map(&:downcase).uniq.each do |word|
#       count[word.downcase] = @tokens.map(&:downcase).count(word.downcase)
#     end
#     count
#   end

# end