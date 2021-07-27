=begin
problem : write a method that given string, and a left and right index, returns a corresponding substring
rules - indices are inclusive
- if index is outside what's possible for string, should jsut do the best it can (not return nil or error)
- if only left index given, should return just one character
- zero length string should return empty string

input: string, left index as int, option right index as int (default = left index ?)
output: new substring

use slice method as follows
string[left_index..right_index]

=end

def substring(str, left_index, right_index = left_index)
  return '' if str == ''
  str.chars[left_index..right_index].join
end

=begin
problem: find all substrings in a string, return an array of the substrings
- no one letter words, no zero letter words?

input: string
output: array containing all substrings

create empty results array
max_right index = string.size - 1
define two variables, left and right index
begin left and right both at zero
  add substring to results array
  increment right index by 1
  repeat until just before out of bounds
increment left index by 1, then set right to zero, and repeat
return the results array

=end

def substrings(str)
  results = []
  max_index = str.size - 1
  (0..max_index).each do |left_index|
    (left_index+1..max_index).each do |right_index|
      results << substring(str, left_index, right_index)
    end
  end
  results.uniq
end

=begin
problem: write a method that returns substrings of a string which are palindromes
palindrome rules: EXACTLY same chars in same positions if reversed, more than one char

input: string
output: array of palindromic strings

create substrings (done with existing method)
select palindromic substrings with is palindrome logic/helper method?
  -if substring == substring.reverse, return true
=end

def palindromes(str)
  substrings(str).select { |sub_string| is_palindrome?(sub_string) }
end

def is_palindrome?(str)
  str == str.reverse
end

=begin
input: string
output: longest palindromic substring

take string, get substrics, then get palindromic substrings.
return max length, using max
=end
def largest_palindrome(str)
  palindromes(str).max_by { |palin| palin.size }
end

p palindromes('ppop') # => ['pp', 'pop']
p largest_palindrome('ppop') # => ['pp', 'pop']


# p substrings('band')
# p substrings('world')
# p substrings('ppop')
# p substrings('a')

# p substring('money', 0, 2)
# p substring('money', 1, 2)
# p substring('money', 3, 9)
# p substring('money', 2)
# p substring('', 4, 34)

