=begin
problem: take an english phrase embodying simple arithmetic, and return integer output
input: arithmatic english phrase "NUM1 OPERATION NUM2" format
output: integer result of computation

transform string into numerical computation
recognize integers from english
recognize operators from english

split string into array of words
words are then num1 = first elment, num2 = last element, operator = middle element
convert num strings into ints
select operatior based on operator

idea: do some string substition, feed result into eval, return is int
=end

# def computer(english)
#   num_strings = %w(zero one two three four five six seven eight nine)
#   operations = { 'plus' => '+', 'minus' => '-' }
#   tokens = english.split
#   num1 = num_strings.index(tokens.first)
#   num2 = num_strings.index(tokens.last)
#   operator = operations[tokens[1]]
#   eval("#{num1}#{operator}#{num2}")
# end

=begin
input: string of format num op num op  ... num
output:  integer result of the arithmetic expression

create hash with format num_string: num_int
create hash with format operator_word: operator_symbol
create copy of string
iterate over string split into words [transformation]
  see if word is a number
    if so, convert numberstring into number 'one' to '1'
  see if word is a operator
      if so, convert operator word into symbol, 'plus' to '+'
join transofmed array of words into string
feed string into eval
=end

def computer(english)
  tokens = { 'zero'=> 0, 'one'=> 1, 'two'=> 2, 'three'=> 3, 'four'=> 4, 'five'=> 5,
    'six'=> 6, 'seven'=> 7, 'eight'=> 8, 'nine'=> 9, 'ten'=> 10, 'plus' => '+', 'minus' => '-',
    'times' => '*', 'divided' => '/' }
  words = english.split.reject { |word| word == 'by' }
  words.map! do |word|
    if tokens[word]
      tokens[word]
    else
      word
    end
  end
  p words.join

  eval(words.join)
end

def is_num?(str)
  str.to_i.to_s == str
end

p computer("two plus two")
p computer('seven minus six')
p computer('zero plus eight')

p computer("two plus two minus three")
p computer("three minus one plus five minus four plus six plus ten minus four")
p computer("2 plus five minus 4 plus six plus 10 minus 4")

p computer('eight times four plus six divided by two minus two')