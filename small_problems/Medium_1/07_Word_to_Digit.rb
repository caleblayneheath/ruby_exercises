WORD_DIGIT = { zero: 0, one: 1, two: 2, three: 3, four: 4, 
               five: 5, six: 6, seven: 7, eight: 8, nine: 9 }.freeze

# def word_to_digit(string)
#   WORD_DIGIT.each do |word, digit|
#     string.gsub!(/\b#{word.to_s}\b/i, digit.to_s)
#   end
#   # string
#   # gets rid of spaces between numbers
#   string.gsub(/(?<=\d)\s(?=\d)/, '')
# end

# further_exploration is not done

# further exploration, remove spaces only between numbers you create
def word_to_digit(string)
  
  WORD_DIGIT.each do |word, digit|
    # word_num_pattern  = /(?<=\s)\b#{word.to_s}\b(?=\s)/i
    word_num_pattern  = /(?<=#{word.to_s}) /i
    string.gsub!(word_num_pattern, '')
  end

  WORD_DIGIT.each do |word, digit|
    string.gsub!(/#{word.to_s}/i, digit.to_s)
  end

  string
  # gets rid of spaces between numbers
  # string.gsub(/(?<=\d)\s(?=\d)/, '')
end

string = 'Please call # 4 4 at five five five one two three four. Thanks.'
p word_to_digit(string)
p word_to_digit(string) == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit(string)
p word_to_digit('forty-Four')
p word_to_digit('freight')
