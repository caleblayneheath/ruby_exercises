=begin
given: a string of words
output: a new string composed of original words, with every word capitalized

split string into array of words
transform each array element so that first letter is upcased
return joined array
=end

def word_cap(str)
  str.split.map do |word| 
    if ["'", '"'].include?(word[0])
      word
    else
      word[0] = word[0].upcase
      word
    end
  end.join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
puts word_cap('this is a "quoted" word')