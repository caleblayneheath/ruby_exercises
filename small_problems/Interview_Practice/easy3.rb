=begin
program gets 6 numbers from user, sees if 6th number is in first 5 entered

create empty array to hold numbers
enter a loop which will conclude when there are 6 numbers in the array
  prompt user to enter a number
  get user input
  append input as int at end of array
using last element of array to search the first five
  if arry[0..-2].include?(arr[-1]) is true
    print arr[-1] does appear
  else
    print that it doesnt

=end

numbers = []
loop do
  puts "Enter a number."
  numbers << gets.chomp.to_i
  break if numbers.size >= 6
end

puts numbers[0..-2].include?(numbers[-1]) ? 'last is there' : 'last is not there'

=begin
Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.

prompt for first positive int
store input in var and convert to int
prompt for second positive int
store input in var

print addition
  subtraction
  product
  division
  modulor
  power

=end

puts "Enter the first positive integer."
int1 = gets.chomp.to_i

puts "Enter the second positive integer."
int2 = gets.chomp.to_i

puts "#{int1} + #{int2} = #{int1 + int2}"
puts "#{int1} - #{int2} = #{int1 - int2}"
puts "#{int1} * #{int2} = #{int1 * int2}"
puts "#{int1} / #{int2} = #{int1 / int2}"
puts "#{int1} % #{int2} = #{int1 % int2}"
puts "#{int1} ** #{int2} = #{int1 ** int2}"

=begin
goal, ask for input of word or multiple words (string of one or more words)
return number of characters, EXCLUDING spaces


input: user defined string of one or more words
output: print to screen number of non-space chars in string

prompt for string of possibly multiple words
store user input in var
split string then rejoin, which removes whitespace
return count of transformed string length

=end

puts "Please enter a string of one or more words"
str = gets.chomp
puts "There are #{str.split.join.size} characters in #{str}."

=begin
input: two numbers
output: the number multiplied

=end

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

=begin
input: based number, power to exponentiate too
output: num ** power

multiply power number of times

num = 3
power = 3

accum = num
# multiplied power - 1 times
multiply(accum, num) => 9
accum = 9
multiply(accum, num) = > 27


=end

def power_to_n(num, power)
  return 1 if power.zero?
  accum = num
  (power - 1).times do
    accum = multiply(accum, num)
  end
  accum
  
end

p multiply(3, 5)
p square(3)
p power_to_n(3, 0)

=begin
input: two bools
output: one bool, true if one of the args is truthy

logic: true only if one of the inputs is true-thy

add !!args to array, (to insure is true or false)
count fo true in array is equal to one

=end

def xor?(arg1, arg2)
  [!!arg1, !!arg2].count(true) == 1
end


p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

=begin
input: an array
output: new array consisting of 1st, 3rd, .. and so on values of original
  index 0, 2 .. 

generate indices I want to collect
  every even number 0...array.size
for each index
  append input_array[indx] to new collection
  
return tnew collection


=end

def oddities(arr)
  (0...arr.size).select(&:even?).map { |idx| arr[idx] }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

=begin
input: string
output: true if palindrome else false

palindrome; reads same forwards and backwards
--now ignore punctuatio, case and spaces

remove case and nonalphanums from strings

see if modified string is same as reversed modified string

=end

def real_palindrome?(str)
  str = str.downcase.chars.select { |char| char =~ /[a-z0-9]/}.join
  
  str == str.reverse
end


p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

=begin
input: integer, i assume positive 
output: true if number has same digits read f-b or b-f

turn int to string
see is string same forward and back

=end

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true