=begin
input: two strings, strings will be different lengths
output: new single string consisting of short_string+long_string+short_string

put args into an array
sort array string arguments by string length
  -sort_by method
append copy of shorter front element to end of array
join array into string


=end

def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |str| str.size }
  arr.push(arr.first).join

end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

=begin
method which takes a year and returns the century

input: integer representing year
output: string representing century
ex: 2000 => '20th'

century rules:
  new century numbers begin in -01 years
    1901-2000 20th century
    01-100 1st century, etc
  century suffixes are
    -st : 1, 21, [EXCEPTIONS numb ends in 11 uses th]
    -nd : 2, 22. [EXCEPTIONS numb ends in 12 uses th]
    -rd : 3, 23, [EXCEPTIONS numb ends in 13 uses th]
    -th : 4, 14, 24 [any num ending in 11, 12, or 13]
    
calculate century number
    (year / 100.0).ceil # round up
look up suffix according to century rules
  


=end

def century(year)
  cent_num = (year / 100.0).ceil.to_s
  
  suffix = case
    when %w(11 12 13).include?(cent_num[-2..-1])
      'th'
    when cent_num[-1] == '1'
      'st'
    when cent_num[-1] == '2'
      'nd'
    when cent_num[-1] == '3'
      'rd'    
    else
      'th'
  end
  cent_num + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

=begin

leap year rules:
  is a leap year 
    if divisible by 4  UNLESS  also divis by 100
    if divisible by 100, not leap year unless year divis by 400
    assume this is true for any year greater than 0
    
  input: integer representing year, greater than  0
  output: true if leap year, else false
  
  is divis by 400?
    leap
  is divis by 4, but not divis by 100
  
=end

def leap_year?(year)
  (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

=begin

leap year rules:
  is a leap year 
    if divisible by 4  UNLESS  also divis by 100
    if divisible by 100, not leap year unless year divis by 400
    assume this is true for any year greater than 0
    
  input: integer representing year, greater than  0
  output: true if leap year, else false
  
  is divis by 400?
    leap
  is divis by 4, but not divis by 100
  
  
  new rules:
    if year before 1752, every year divis by 4 is leap year
  
=end

def leap_year?(year)
  return true if (year < 1752) && (year % 4).zero?
  
  (year % 400).zero? || ((year % 4).zero? && !(year % 100).zero?)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

=begin
look for multiples of 3 or 5 that lie between (incluseive) 1 and some other number
then find the sum of those multiples

input: int greater than one
output: integer, sum of all multiples of 3 or 5 that exist in 1..input

create range of 1..input
select from range all multiples of 3 or 5
return sum of selection array


=end

def multisum(num)
  results = (1..num).select do |int|
    (int % 3).zero? || (int % 5).zero?
  end
  results.sum
  
end

p multisum(3) #== 3
p multisum(5) #== 8
p multisum(10) #== 33
p multisum(1000) #== 234168

=begin
given an array of nums, return array with same num of elements,
where each element is now running total

input: array of nums
output: array of transformed running total numbs
[1st, 2nd, 3rd] => [1st, 1st + 2nd, 1st + 2nd + 3rd]

empty array should return an empty array


return [] if input is empty array

create counter = 0
iterate through array as transformation
  elem += counter
return transfomrec dollection

=end

def running_total(arr)
  return [] if arr.empty?
  
  total = 0
  arr.map do |num| 
    total += num
  end
end


p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

=begin
turns string of numerics  to an int
CANNOT USE .to_i or Integer()
assume valid chars, ignore + or - for now

rules for digits:
  each digit represents a single num times a power of ten
  123 is 1 * 100  +  2 * 10  + 3 * 1
  righmost digit's power of ten is 1
    next digit is 10x the old

  set starting power = 1
  set starting total = 0
  iterate through each char of num string in reverse order
    get int from string digit using digit.ord - 48
    total += power * digit
    power *= 10
  return total

=end

def string_to_integer(str)
  power = 1
  total = 0
  str.chars.reverse_each do |digit|
    num = digit.ord - 48
    total += num * power
    power *= 10
  end
  total
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

=begin
turns string of numerics  to an int
CANNOT USE .to_i or Integer()
assume valid chars, ignore + or - for now

rules for digits:
  each digit represents a single num times a power of ten
  123 is 1 * 100  +  2 * 10  + 3 * 1
  righmost digit's power of ten is 1
    next digit is 10x the old

  set starting power = 1
  set starting total = 0
  iterate through each char of num string in reverse order
    get int from string digit using digit.ord - 48
    total += power * digit
    power *= 10
  return total

=end

def string_to_integer(str)
  power = 1
  total = 0
  str.chars.reverse_each do |digit|
    num = digit.ord - 48
    total += num * power
    power *= 10
  end
  total
end


=begin
input: str of digits, with option + or - prefix
output: integer equiv of digits, with appropriate sign

is first char a + or - ?
  if no , send input to string_to_integer
  
  if yes,
      need to send digit into string_to_integer WITHOUT prefix
        can use slicing
      multiply return from prev method by -1 if prefix is -

=end

def string_to_signed_integer(str)
  prefix = 1
  if str[0] == '+' || str[0] == '-'
    prefix = -1 if str[0] == '-'
    str = str[1..-1]
  end
 prefix * string_to_integer(str)
  
end

p string_to_signed_integer('4321') #== 4321
p string_to_signed_integer('-570') #== -570
p string_to_signed_integer('+100') #== 100

=begin
turn positive or zero integer into string
DO NOT USE .to_s, String(), format or similar

input: integer 0 or greater
output: string represent tation of integer

-break down each digit of the int into a single number
then compare single number with some reference to strings
- {1: '1', etc } 

create empty result string
loop
  num % 10 => gives rightmost digit
  do stuff to rightmost digit to get string representation
    append hash[digit] to result string
  add str_num to result
  num = num / 10
  break if num == 0
end

return string.join result
=end

def integer_to_string(num)
  hsh = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
  6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0' }
  
  result = ''
  loop do
    digit = num % 10
    result = hsh[digit] + result
    num /= 10
    break if num == 0
  end
  
  result
end

=begin
input: signed integer
output: string version of signed integer
  + before int > 0
  - before int < 0
  nothing before 0
  
  prefix = ''
  see if int is positive, negative, or zero
    int > 0
      prefix = '+'
    int < 0 
      prefix = '-'
  then make  int positive using abs
  return prefix + integer_to_string(num)

=end

def signed_integer_to_string(num)
  prefix = if num > 0
             '+'
           elsif num < 0
             '-'
           else
             ''
           end
  prefix + integer_to_string(num.abs)

end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(0) == '0'
p signed_integer_to_string(-123) == '-123'