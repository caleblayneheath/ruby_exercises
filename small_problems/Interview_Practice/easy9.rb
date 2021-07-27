
=begin
input: names stored in array, title and occupation in hash
output: "Hello, #{name}! Nice to have a #{occupation} around."

=end


def greetings(name_arr, work_hash)
  puts "Hello, #{name_arr.join(' ')}! Nice to have a #{work_hash.values.join(' ')} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.


=begin
input: integer
output: input * 2, unless input is double number, then return as is

double number is one whose left side digits are same as right side
-by definition all double numbers must have even number of digits and
have a number of digits greater than 1
-all must be positive

double number >= 10
num.to_s.size.even? && num.to_s.size > 1
left == right 

is number a double number?
  store string version of number
  see num.to_s.size.even? && num.to_s.size > 1 && left == right
      4545
      [0...size/2][size/2...size]

if no
  return number * 2
if yes
  return unmodded


=end

def twice(num)
  is_double_number?(num) ? num : num * 2
end

def is_double_number?(num)
  str = num.to_s
  size = str.size
  size.even? && size > 1 && str[0...size/2] == str[size/2...size]
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

=begin
input: number
output: if input positive, return negatie
if zero or negative, return original




=end

def negative(num)
  -num.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0  


=begin
input: integer > 0
output: an array counting from 1 to the input

=end

def sequence(num)
  (1..num).to_a
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]


=begin
input: string
output: true if all alpha chars are uppercase, else false
ignore nore alpha chars

get all alpha chars in str
  each_char.select { |char| alpha.include?(char.downcase) }
  if there are no alpha chars, return true

  if there are alpha chars, see if any are lowercase
    take selection and use any?
    if any true return false, else true
=end


def uppercase?(str)
  alpha = ('A'..'Z').to_a.join
  
  alpha_chars = str.each_char.select do |char| 
    alpha.include?(char.upcase)
  end
  
  
  alpha_chars.each do |char|
    return false if alpha.downcase.include?(char)
  end

  true  
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true


=begin
input: string of words, seperated by one space, word is any group of chars/nonspace

output:array where each element has format 'word letters in word'

split string into array of words
transform array of words
  "#{word} #{word.size}"

=end


def word_lengths(str)
  str.split.map { |word| "#{word} #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []


=begin
input: string, format of 'firstname lastname'
output: new string of format 'lastname, firstname'

=end

def swap_name(name)
  names = name.split
  "#{names.last}, #{names.first}"
  
end


p swap_name('Joe Roberts') == 'Roberts, Joe'


=begin
input: two ints, count (>=0) and first num in sequnce
output: an array, [first_num, next_multiple, next_multiple ] until array is size count

if count is zero, return an empty array


create empty results array
current = num
loop number of times equal to count
  results << current
  current += num

return results
=end

def sequence(count, num)
  result = []
  current = num
  count.times do 
    result << current
    current += num
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []


=begin
input: three numbers, scores between 0 and 100, no checking needed
output: latter value associationed with average of input scores

sum all inputs together then divide by three for average
check in condition to see if it fits

=end

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3)/3
  
  hsh = {'A' => (90..100),
  'B' => (80...90),
  'C' => (70...80),
  'D' => (60...70),
  'F' => (0...60)
  }
  
  grade = ''
  hsh.each do |letter, range|
    if range.include?(average)
      grade = letter
    end
  end
  grade
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

=begin
input: array of arrays, subarray has format [fruit_string, num of fruits]
output: single array (no subarrays) with the correct number of fruits

so if a subarray is 'aaplples', 3,
then the output array should have three elements 'apple'

create an empty results array
for each sub_array
  a number of times equal to sub.last
    append sub.first to results
    
results


=end

def buy_fruit(list)
  results = []
  list.each do |subarr|
    subarr.last.times { results << subarr.first }
  end
  results
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) == ["apples", "apples", "apples", "orange", "bananas","bananas"]
