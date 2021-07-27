=begin
write a method, takes a string and a positive int, and prints string a number of times equal to int

input: string, int (number of times string should be printed out)
output: to the screen, the string printed int number of times

=end

def repeat(string, num)
  num.times{ puts string }
end

# repeat('Hello', 3)


=begin
input: integer
output: boolean true

if input is odd number, return true, else false
  arg is valid integer
  CANT USE ODD OR EVEN

rules: odd numbers when divided by 2, have a remainder of 1

if input % 2 == 1, return true
=end

def is_odd?(num)
  (num % 2) == 1
end

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

=begin
input: positive integer
output: array of the digits (as ints) of the integer input

split digits making up number into an array of those digits as ints
123 => [1, 2, 3]

turn integer to string
split string into array of chars
turns chars in array into ints
return array
=end

def digit_list(num)
  num.to_s.chars.map { |char| char.to_i }
end

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true


=begin
given an array, count how many times each element appears, print results
input: array
output: printout of elements followed by occurances elem => num_of_occurs

get array of unique elements in input array, using uniq
for each elem in uniq array, use count to get number of times it appears in input array
print results
=end

def count_occurrences(arry)
  arry.uniq.each do |elem|
    puts "#{elem} => #{arry.count(elem)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# count_occurrences(vehicles)

=begin
input: string
output: new string with words in reverse

split string into array of words
call reverse on array of words
join array with ' '
return array
=end

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

=begin
input: string, only letters and spaces
output: new string where words of 5 or more letters have chars reversed

SPACES ONLY WHEN MORE THAN ONE WORD IS PRESENT

split string into array of words
iterate through array of words
transform elements with 5 or more letters into char reversed versions
  if str.length >= 5
    split word into array of chars
    reverse array of chars
    join reversed array
  else
    elem
  end
join array elements
return new string
=end

def reverse_words(str)
  str.split.map { |word| word.length >= 5 ? word.chars.reverse.join : word }.join(' ')
end

# puts reverse_words('Professional')          # => lanoisseforP
# puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
# puts reverse_words('Launch School')         # => hcnuaL loohcS

=begin
input: positive integer, to be used for length of generated string
      also arg with default to '1', if arg is set to '0', strings should start at zero
output: string of consecutive 1s and 0s, that is a length of the input int

create empty string
initialize boolean flag append_start_char? = true
for each number from 1 to int
  if append_start_char?
    append start_char
  else
    append other char
  end
  flip append_start_char? flag
return string
=end

def stringy(num, start_char = 1)
  other_char = if start_char == 1
                 '0'
               elsif start_char == 0
                 '1'
               end
  
  result = ''
  use_start = true
  (1..num).each do |int|
    use_start ? result << start_char.to_s : result << other_char
    
    
    use_start = use_start ? false : true
    
  end
  result
end


# def stringy(num)
#   result = ''
#   (1..num).each do |int|
#     int.odd? ? result << '1' : result << '0'
#   end
#   result
# end

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4, 0) == '0101'
# puts stringy(7) == '1010101'

=begin
input: array of positive integers
output: average of all numbers in the array as an int? a float?

get sum of all elems in array 
divide by number of elems in array
=end

def average(arry)
  arry.sum / arry.size.to_f
end

# puts average([1, 5, 87, 45, 8, 8]) #== 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
input: positive int
output: sum of all digits in the int

turn into into string
split string into array of chars
turn chars in array into ints
sum all ints in array
return sum
=end

def sum(arry)
  arry.to_s.chars.map(&:to_i).sum
end

# puts sum(23) #== 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

=begin
input: positive int(salary), boolean(bonus yes or no)
output: bonus for given int(salary), half salary if bool true, else zero

if bool true, return half salary, else zero
=end

def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000