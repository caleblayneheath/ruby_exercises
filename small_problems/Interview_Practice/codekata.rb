# return array of suspects with illegal items in their pockets

=begin
input: hash pockets person: [array of nums], array of nums
output: array of symbols
  symbols return should be those keys which have values  in array of nums input
  
if no array of nums provided, return all names
if all objects found, retunr nil

create empty array suspects
iterate through hash
  if value of present key is in input array
    append key to suspects
return suspects

=end

def find_suspects(pockets, allowed_items)
  suspects = []
  pockets.each do |person, contents|
    unless contents.nil?
      contents.each do |item|
        suspects << person unless allowed_items.include?(item)
      end
    end
  end
  
  suspects.empty? ? nil : suspects.uniq

end

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

p find_suspects(pockets, [1, 2]) # => [:tom, :jane]
p find_suspects(pockets, [1, 7, 5, 2]) # => nil
p find_suspects(pockets, []) # => [:bob, :tom, :jane]
p find_suspects(pockets, [7]) # => [:bob, :tom]


# -- DELETE A DIGIT
=begin
Task
Given an integer n, find the maximal number you can obtain 
by deleting exactly one digit of the given number.

Constraints: 10 ≤ n ≤ 1000000.

input: integer, at least two digits
output: integer with one digit deleted, that is as large as possible

turn number to string
get all substrings of size str.size-1
  start at 0..1, left is going from 0...-1

turn each substring to int
get then maximum value

=end

def delete_digit(num)
  substrings = []
  num_string = num.to_s
  (0...num_string.size).each do |digit|
    work_str = num_string.chars
    work_str.delete_at(digit)
    substrings << work_str.join
  end
  
  new_nums = substrings.map(&:to_i)
  new_nums.max
end

p delete_digit(152) # 52
p delete_digit(1001) # 101
p delete_digit(10) # 1



=begin
input: array
output: outlier, the one even or odd elem in an array filled with the opposite

the sum of any amount of even numbers is even
  if you add an odd number, the sum is now odd

the sum of any amount of odd numbers is evev
  if you add an even number, the sum is still even
  
  if sum is odd
    then the outlier is odd
  if sum is even
    then the outlider is even
  

=end

def find_outlier(integers)
  integers.sum.odd? ? integers.select{|i| i.odd?}[0] : integers.select{|i| i.even?}[0]
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2,6,8,10,3]) == 3


=begin
Re-order the characters of a string, so that they are concatenated into a new string 
in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:
alphabetized("The Holy Bible") # "BbeehHilloTy"

if a cap letter appears before lowercase equiv,
  then cap letter should appear first
  and vice versa
  
  
input: string, with no numerals, and only alpha chars
output: new string with all non alpha chars removed, sorted alphabetically by case insensititivy

clean string of non alpha chars


=end

def alphabetized(str)
  alpha = ('a'..'z').to_a.join
  clean_str = str.chars.select { |char| alpha.include?(char.downcase) }.join
  clean_str.chars.sort_by { |char| char.downcase }.join
end

p alphabetized("") # "")
p alphabetized(" ") # "")
p alphabetized(" a") # "a")
p alphabetized("a ") # "a")
p alphabetized(" a ") # "a")
p alphabetized("A b B a") # "AabB")
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"


=begin
Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: 
The numeric values represent the occurrence of each letter preceding that numeric value. 
There should be no numeric characters in the final string. 
Empty strings should return an empty string.

The first occurrence of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears.

string_expansion('3D2a5d2f') == 'DDDaadddddff'
string_expansion('3abc') == 'aaabbbccc'       # correct
string_expansion('3abc') != 'aaabc'           # wrong
string_expansion('3abc') != 'abcabcabc'       # wrong

If there are two consecutive numeric characters the first one is ignored.
string_expansion('3d332f2a') == 'dddffaa'

If there are two consecutive alphabetic characters then the first character has no effect on the one after it.
string_expansion('abcde') == 'abcde'

Your code should be able to work for both lower and capital case letters.

input: string
output: string with chars expanded by looking at preceding number


iterate through each char
  if char is a number followed by an alpha
    get all chars between current number and next number
    for each char, repeat it a number of times equl to current number
  move to next number
  

=end

def string_expansion(str)
  chars = str.chars
  alpha = ('a'..'z')
  digit = ('0'..'9')
  
  result = ''
  count = 1  
  chars.each do |char|
    if digit.include?(char)
      count = char.to_i
    end
    if alpha.include?(char.downcase)
      result << char * count
    end
  end
  
  result
end

p string_expansion('') == ''
p string_expansion('3abc') == 'aaabbbccc'
p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('0d0a0v0t0y') == ''
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde') == 'abcde'


=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up.
Rules
   1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

input: str, could be empty, definitely lowerspace
output: an array contianing copies of the original string, where each element has a subsequent letter capialized

if there is no char to capitalize, you should skip adding it tot he results array

create an empty results array
iterate through each char with the string use each_with_index
  if char is alpha
    upcase that char using index
    append to results the word with a modified char
  else
    ignore

return results array

=end

def wave(str)
  alpha = ('a'..'z')
  results = []
  str.chars.each_with_index do |char, idx|
    if alpha.include?(char)
      work_str = str.dup
      work_str[idx] = work_str[idx].upcase
      results << work_str
    end
  end
  results
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]



=begin
In this kata you are required to, given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

input: string
output: string where every alpha char has been replaced by its alphabetic position index a= 1, b = 2 etc
these indices are separated by a space

new string only consists of alpha chars
then downcase the string
split string into array of chars
for each char in array transform to index position
  use (char.ord - 96).to_s
join array into string with spaces and return


=end

def alphabet_position(str)
  alpha = 'a'..'z'
  chars = str.chars.select { |char| alpha.include?(char.downcase) }
  chars = chars.map do |char|
    char = char.downcase
    (char.ord - 96).to_s
  end
  chars.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" # true


=begin
Move the first letter of each word to the end of it, then add "ay" to the end 
of the word. Leave punctuation marks untouched.

input: str
output: new str with piglatin rules applied, ignore puncuation
  1st letter of word goes to end, then add ay
  
  ignore single letter words
  
split str into words
transform each word
  check and make sure word is all alphabetical and size 2 or more
  if yes, apply pig latin transofmraton
    word[1..-1] + word[0] + 'ay'
  else
    leave word
rejoin transofrmed collection to string and return
  
=end

def pig_it(str)
  alpha = 'a'..'z'
  
  str.split(/\s/).map do |word|
    if word.size >= 2 && word.chars.all?{ |char| alpha.include?(char.downcase) }
      word[1..-1] + word[0] + 'ay'
    else
      word
    end
  end.join(' ')
  
end

p pig_it('Pig latin is cool') # igPay atinlay siay oolcay
p pig_it('Hello world !')     # elloHay orldway !

