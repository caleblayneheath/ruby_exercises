def word_cap(string)
  # string.split.map { |word| word.capitalize }.join(' ')
  # string.split.map(&:capitalize).join(' ')

  # Further Exploration 1
  # string.split.map do |word|
  #   word[0].upcase + word[1..-1].downcase
  # end.join(' ')

  #Further Exploration 2
  string.split.map do |word|
    # first downcase anything capitalized
    # second upcase the first char (denoted by ^) if it is in a-z
    word.gsub(/A-Z/, &:downcase).gsub(/^[a-z]/, &:upcase)
  end.join(' ')

end

p word_cap('four score and seven') #== 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') #== 'This Is A "quoted" Word'