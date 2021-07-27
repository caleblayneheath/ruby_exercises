=begin
input: string
output: all substrings that palindromic
palindromic, rrange in same sequence as original substrings
,inlcudce duplicate palindromes

-same sequnce of chars forwards and backwards
-case and all chars should be considered
-no single letter substring is a palindrome

get all substrings
select from substrings
  -original == reverse
  AND
  -length > 1

=end

def substrings_at_start(str)
  results = []
  (0...str.size).each do |idx|
    results << str[0..idx]
  end
  results
end

def substrings(str)
  results = []
  (0...str.size).each do |idx|
    results << substrings_at_start(str[idx...str.size])
  end
  results.flatten
end

def palindromes(str)
  possibles = substrings(str)
  possibles.select do |substr|
    substr == substr.reverse && substr.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

=begin
input: two nums(ints), beginning and ending
output: printout all numbers between begin and end inclusive
  if num divis by 3 print fizz
  if num divis by 5 print buzz
  if num divis by 3 and 5 print fizzbuzz


=end

def fizzbuzz(first, last)
  (first..last).each do |num|
    case
    when num % 3 == 0 && num % 3 == 0
      puts 'FizzBuzz'
    when num % 3 == 0
      puts 'Fizz'
    when num % 5 == 0 
      puts 'Buzz'
    else
      puts num
    end
  end
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


=begin
input: string
output: new string, but every char is doubled in place

create empty result string
iterATE THRough each char of str
append it twice to the result string
return result


=end

def repeater(str)
  result = ''
  str.each_char do |char|
    result << char * 2  
  end
  result
  
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=begin
input: string
output: new string, but every char is doubled in place

create empty result string
iterATE THRough each char of str
append it twice to the result string
return result


=end

def repeater(str)
  result = ''
  str.each_char do |char|
    result << char * 2  
  end
  result
  
end

=begin
input: string
output: new string with similar output
  double every consonant

create empty result string
iterate through each char of input string
  if char in consonants
    call repeater(char) and append to results
  else
    append char to results
    
return results

=end

def double_consonants(str)
  consonants = 'bcdfghjklmnpqrstvwxyz'
  
  result = ''
  str.each_char do |char|
    if consonants.include?(char.downcase)
      result << repeater(char)
    else
      result << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin
input: positive integer
output: integer, but with digits reversed


=end


def reversed_number(num)
  num.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

=begin
input: nonempty string
output: middle char of string
  if odd, return exact middle
  if even, return two middle chars

aba
0 1 2 

if odd
  str.size / 2
  
0 1 2 3
str size is 4, i want 1 and 2
if even
  (str.size / 2) - 1 then next number
=end


def center_of(str)
  str.size.odd? ? str[str.size/2] : str[(str.size/2)-1, 2]
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') #== 'hs'
p center_of('x') #== 'x'



