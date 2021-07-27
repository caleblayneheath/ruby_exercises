=begin
input: two arrays, nonempty and the same size
output: one array, with elements from both arrays placed in alternating order
1st from arr1, 1st from arr2, 2nd from arr1, etc.



=end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']

=begin
input: string
output: hash with format lowercase:, uppercase:, neither:, where values
are count of letters appropriate to key

empty string should return zeros for all hash

create reference string of all letters in lowercase
define hash with all 3 cases as keys and values set to zero

find coutn of all lowercase chars
  array.count(alpha)
  put val in hash
find all uppercase chars
  arra.count(alpha.upcase)
  put val in hash
find all neithers
  take total and subtract sum of lower+uppercase chars
  string.size - hash[lowercase] - hash[uppercase
  put val in hash

=end


def letter_case_count(str)
  alpha = ('a'..'z').to_a.join
  results = {lowercase: 0, uppercase: 0, neither: 0}
  
  results[:lowercase] = str.count(alpha)
  results[:uppercase] = str.count(alpha.upcase)
  results[:neither] = str.size - results[:lowercase] - results[:uppercase]
  results
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

=begin
input: a string
output: new string, where each word has its first letter upcased
and all the rest downcased

words in quotation marks shouldn't be modified
word is any sequency of non blank char

split string in array of words
transform array of words
  word.capitalize unless word[0] is a quotation mark
  
return transformed array joined into a string

=end

def word_cap(str)
  str.split.map do |word|
    # (word[0] == '"' || word[0] == "'") ? word : word.capitalize
    word.capitalize
  end.join(' ')
end


p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

=begin

input: take a string
output: new string where every case is swapped for letters

define reference string which has all the lowercase letters
define another string for the uppercase letters
creat empty result string
iterate through every letter in the string
  if lowercase reference includes the letter, makeupper
  if uppercase reference includes the letter, makelower
  then append leter to empty result string
return result string

=end

def swapcase(str)
  lower_alpha = ('a'..'z').to_a.join
  upper_alpha = lower_alpha.upcase
  
  result = ''
  str.each_char do |char|
    if lower_alpha.include?(char)
      result << char.upcase
    elsif upper_alpha.include?(char)
      result << char.downcase
    else
      result << char
    end
  end
  result
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

=begin
input: a string
output: a new string transformed according to following rules
-every other character is capitalized
  - every odd position, or even index is capitalized
-other chars are downcased
  -every even position, or odd index is downcased
-nonletter chars shouldno't be changed but do count for positioning


create empty result string
get range of indices by 0...input.size
for each num in indices
  access input[index]
  if index.even?
    result << input[index].upcase
  else
    result << input[index].downcase
    
return result str
=end

def staggered_case(str)
  result = ''
  (0...str.size).each do |idx|
    word = idx.even? ? str[idx].upcase : str[idx].downcase
    result << word
  end
  result
  
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

=begin
input: a string
output: a new string transformed according to following rules
-every other character is capitalized
-other chars are downcased
-nonletter chars shouldno't be changed but don't count for positioning

-first letter char is capitalized


create empty result string
initialize flag of upcase as true

iterate over ever char in str
for each char in str, ask...
  is this a letter? (see if downcase char in range of 'a'..'z'
    yes
      upcase or downcase letter as appropriate
        if upcase true, upcase,
        else downcase
      store information to determine case of next letter
        switch from upcase to downcase, or vice versa
      append to result str
    no
      append to result str
return result str



=end



def staggered_case(str)
  result = ''
  upcase = true
  
  str.chars.each do |char|
    if ('a'..'z').include?(char.downcase)
      char = upcase ? char.upcase : char.downcase
      upcase = upcase ? false : true
    end
    result << char
  end
  result
  
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'


=begin
input: array of ints, non empty
output: printout of multiplicative average, rounded to 3 decimals
  multiply all elements of array together / number of elements in array


use reduce to get product of all elements
divide product by arr.size

print value.round(3)

=end

def show_multiplicative_average(arr)
  result = (arr.reduce(:*) / arr.size.to_f ).round(3).to_s
  
  puts pad_to_three(result)
  
  
end

=begin
input: string of float number 4.6 rounded to 3 dec imal places
output: new string wtih zeros appended until 3 decimal places all filled

split str by '.' and store in val
see if last val in arr has size 3
  if yes, do nothing and break from loop
  if no, append a zero and continue
return arr joinined by '.'

=end

def pad_to_three(str)
  arr = str.split('.')
  loop do
    arr.last.size >= 3 ? break : arr[-1] << '0'
  end
  arr.join('.')
end

show_multiplicative_average([3, 5])
# The result is 7.500

show_multiplicative_average([6])
# The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
# The result is 28361.667


=begin
input: two equal sized nonempty arrays of numbers
output: single array containing products of corresponding elements of input arrays, arr1.first * arr2.first

create empty results array
get range of one array
iterate throguh range
  access values at corre indices using range
  mulitply values and append to results array
return results array

=end

def multiply_list(arr1, arr2)
  results = []
  (0...arr1.size).each do |idx|
    results << arr1[idx] * arr2[idx]
  end
  results
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


=begin
input: two arrays of nums, neither empty
output: array with every possible combination of multiplications between two arrays, sorted by increasing value

create empty results array
iterate through all elements of first array
  access every value within second array
  for each val in second array, multiply by current element of first array
  append to results
return sorted results

=end

def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |num1|
    arr2.each do |num2|
      results << num1 * num2
    end
  end
  results.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
input: string of at least two words, words are any sequence of nonblanks
output: next to last word in input string

=begin
input: array of numbers, always at least 1
output: sum of the sums of each leading subsequence for that array

initialize total of 0
get range of 0...arr.size
  for each num in range add sum of arr[0..num] to toal
  
return total

=end

def sum_of_sums(arr)
  total = 0
  (0...arr.size).each do |idx|
    total += arr[0..idx].sum
  end
  total
  
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
input: string
output: each subsequent substring, starting from beginning char

create empty results array
get range of 0...str.size
iterate through range
  append array the substring 0..num
results
=end

def substrings_at_start(str)
  results = []
  (0...str.size).each do |idx|
    results << str[0..idx]
  end
  results
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']



def penultimate(str)
  str.split[-2]  
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'


=begin
input: string
output: each subsequent substring, starting from beginning char

create empty results array
get range of 0...str.size
iterate through range
  append array the substring 0..num
results
=end

def substrings_at_start(str)
  results = []
  (0...str.size).each do |idx|
    results << str[0..idx]
  end
  results
end

=begin
input: string
output: all substrings, arranged in order of occurance of first char, then length

create empty results array
get range 0...str.size
iterate through range of primary str
  append to array the substring (num...str.size)
  
return results flatten

=end

def substrings(str)
  results = []
  (0...str.size).each do |idx|
    results << substrings_at_start(str[idx...str.size])
  end
  results.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]


