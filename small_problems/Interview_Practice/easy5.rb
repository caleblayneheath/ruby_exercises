=begin
input: string
output: integer, ASCII string value

ASCII string value = sum of ACII value of every char

turn string into an array of chars
transform chars from strings into ACSCII integer values
  char.ord
sum up transformed array

=end

def ascii_value(str)
  str.chars.map(&:ord).sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
input: integer, pos or negative, which is minutes after or before midnight, repsectively

output: hh:mm formatted time string, 24 hours

IGNORE DST, THE TIME OR DATE CLASSES

hour = 60 minutes
minutes in day = 1440
hours in day = 24

0 input means midnight

determine if time should be incremented forward or backwarc
  -positive counts forward, else backward
turn minutes into hours and minutes
  for positive times
    minutes = input % 60
    hour = (input % 24 * 60) / 60
return formatted string
=end

MIN_IN_HOUR = 60
HOURS_IN_DAY = 24

def time_of_day(time)
  minute = (time % 60).to_s
  hour = ((time % (MIN_IN_HOUR * HOURS_IN_DAY)) / MIN_IN_HOUR).to_s
  minute = pad_time(minute)
  hour = pad_time(hour)
  "#{hour}:#{minute}" 
end

def pad_time(time)
  time.length == 1 ? '0' + time : time
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

=begin
two methods, one returns minutes before, another after midnight

input: a string in hh:mm format
output: number of minutes before or after midnight
value should be in 0..1439

don't use date or time

after midnight
  get int versions of hour and minute
    split string by ':' delimiter should [hour, minute]
    turn strings into integers
  total = minute + (hour * 60)
  return total

=end

def after_midnight(time)
  hour, minute = time.split(':')
  hour = hour.to_i
  minute = minute.to_i
  total = minute + (hour * 60)
  total > 1439 ? 0 : total
end

def before_midnight(time)
  total = (24 * 60) - after_midnight(time)
  total > 1439 ? 0 : total
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
input: string
output: new string, where first and last char of each word are swapped

each word is separated by sapces
every word has at least 1 letter
at least 1 word in every string
string has only words and spaces

split string into array of words
map for each word
  word[-1] + word[1..-2] + word [0]
array.join

=end

def swap(str)
  str = str.split.map do |word|
    word.length > 1 ? word[-1] + word[1..-2] + word[0] : word
  end
  str.join(' ')
  
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=begin
input: string containg alphabetic and nonalphabetic chars
output: new version of input string where
  nonalphabetic chars have been replaced by spaces
    -if more than one nonalpha char is replaced, it should produce only one space
    
create empty result string
iterate over original string
  if alpha
    add as it
  if char non-alpha
    replace with space


return result string

replace every nonalpha char with ' '
  gsub(/[^a-zA-Z]/, ' ')
check if begin or end of string includes ' '
  if yes, set begin/end = ''
  
split string in words then join with ' '
  problem: what about spaces at begin or end?

begin + string.join(' ') + end

=end

def cleanup(str)
  #   allowed = ('a'..'z').to_a + [' ']
  #   result = ''
  #   str.chars.each do |char|
  #     if allowed.include?(char.downcase)
  #       result << char
  #     end
      
  #   end
  #   result
    str = str.gsub(/[^a-zA-Z]/, ' ')
    start = str[0] == ' ' ? ' ' : ''
    finish = str[-1] == ' ' ? ' ' : ''
      
    start + str.split.join(' ') + finish
  end
  
  p cleanup("---what's my +*& line?") == ' what s my line '

  
  =begin
input: string, one or more space sep words
  words are any string without a space( can include punctuation)
output: hash or type num_of_letters: words_with_that_num_of_letters

EMPTY STRING SHOULD PRODUCE EMPTY HASH

create array of words by splitting string by spaces
transform array of words into array of ints eqaul to word length
create new hash with rules that nonexistent key[val] = 0
iterate through array of ints, increment key[int] by one
return hash

=end

def word_sizes(str)
  counts = str.split.map(&:length)
  hsh = {}
  counts.uniq.each { |num| hsh[num] = counts.count(num) }
  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

=begin
input: string, one or more space sep words
  words are any string without a space( can include punctuation)
output: hash or type num_of_letters: words_with_that_num_of_letters

EMPTY STRING SHOULD PRODUCE EMPTY HASH

create array of words by splitting string by spaces
transform array of words into array of ints eqaul to word length
create new hash with rules that nonexistent key[val] = 0
iterate through array of ints, increment key[int] by one
return hash

=end

def word_sizes(str)
  counts = str.gsub(/[^a-zA-Z ]/, '').split.map(&:length)
  hsh = {}
  counts.uniq.each { |num| hsh[num] = counts.count(num) }
  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

=begin
input: an array of integers in 0..19
output: new array, where integers sorted alphabetically by english words for each number

make hash where key:val is int:english
  for 0..19
  hsh[num] = alphabetic_num[num]

sort array by


arr.sort_by { |num| alphabetic_num[num] }


=end

alphabetic_num = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen).sort

# p alphabetic_num

def alphabetic_number_sort(arr)
  alphabetic_num = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen)
  
  arr.sort_by { |num| alphabetic_num[num] }
  
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

=begin
input: string
output: string where consecutive letters of same type squeezed down to one instance

CANNOT USE SQUEEZE METHOD

if string is 1 or 0 length, return that

create tmpy result string
append first char to string
iterate through each char in string[1..-1]
    is last letter same as current letter?
      if yes
        don't append
      else
        do append
return result string

=end

def crunch(str)
  return str.dup if str.length < 1
  
  result = ''
  result << str[0]
  (1...str.length).each do |idx|
    result << str[idx] unless str[idx-1] == str[idx]
  end
  result
  
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

=begin
input: a string of text
output: prints out the string in a banner box

+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

line descriptions
top/bottom: '+' + '-' * (str.length+2) + '+'
2ndfrom: '|' + ' ' * (str.length+2) + '|'
text_line: '| ' + str + ' |'

=end

def print_in_box(str)
  puts '+' + ('-' * (str.length+2)) + '+'
  puts '|' + ' ' * (str.length+2) + '|'
  puts '| ' + str + ' |'
  puts '|' + ' ' * (str.length+2) + '|'
  puts '+' + ('-' * (str.length+2)) + '+'

end

print_in_box('To boldly go where no one has gone before.')
puts
print_in_box('')

#test mod