=begin
input: array of some elements, at lease size 1
output: new array of elements with each element shfited over once, wraparound

DON'T USE ROTATE


if array size 1
  return new array with only element
if array size >1
  array[1..-1] + array[0]

=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

=begin
input: integar number, positive integer showing how many right most digits to rotate
output: take n rightmost digits, perform wraparound rotation once
n 1 means same number is returned

first turn int into string
seperate string into array of chars
use -n to determine needed indices
char_array[0..-5]
            0...-n  [-n..-1]

=end

def rotate_rightmost_digits(num, n)
  arr = num.to_s.chars
  (arr[0...-n] + rotate_array(arr[-n..-1])).join.to_i
end


=begin

calling rotate rightmost digits a number o f times equal to num_of_digits
on successively smaller slices

left bound starts at zero (or negative size, ends at -1
each iteration the left bound incrments by one

start with original array
loop do
update arr as being arr[0...leftbound] + rotate_rightmost_digits([left..-1]]
increment left
break when left bound is greater than -size?
end

=end

def max_rotation(num)
  work_num = num
  left = num.to_s.size
  loop do
    work_num = rotate_rightmost_digits(work_num, left)
    left = left - 1
    break if left == 0
  end
  work_num
end

# p rotate_rightmost_digits(735291, 6)
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


=begin
input: int, a number of switches
output: array identifying which lights 1..input are on

EVERY LIGHT STARTS AT ON

first toggle every swithc
then every 2nd switch
then every 3rd switch
etc.
until you've done it n times


first create an array of trues with n elements
  true is light on, false is light off
perform repition n number of times
  use each with index to iterate over lights
    if index +1 is divis by n
      toggle current count light switch (1, 2, 3 etc)

create empty index results array
use each with index to collect all index positions with true element
  add 1 to each index to get position
  append position to results
return results
  
=end

def lights(n)
  
  switches = [false] * n
  n.times do |num|
    switches.each_with_index do |elem, idx|
      if ((idx + 1) % (num +1)) == 0
        switches[idx] = elem ? false : true
      end
    end
  end

  results = []
  switches.each_with_index do |elem,  idx|
    results << (idx + 1) if elem == true
  end
  results
end

p lights(5) #== [1, 4]
p lights(10) #== [1, 4, 9]
p lights(37) 


=begin
input: n, an odd integer
output: print out a diamond such as
 * # 1 space + 1 star
*** #          3 star
 * # 1 space + 1 star
 
  *   # 2 space + 1 star
 ***  # 1 space + 3 star
***** #           5 star
 ***
  *
 
 start with spaces equal to n/2 and stars equal to 1
 each next line should be one less space and 2 more stars
 if 0 spaces and n stars
  stop
 
 
=end


def diamond(n)
  star = '*'
  space = ' '

  num_star = 1
  num_space = n/2
  
  loop do
    puts (space * num_space) + (star * num_star)
    num_star += 2
    num_space -= 1
    break if num_star > n
  end
  
  num_star = n - 2
  num_space = (n - num_star) /2
  loop do
    puts (space * num_space) + (star * num_star)
    num_star -= 2
    num_space += 1
    break if num_star < 1
  end
  

end

diamond(9)


=begin
input: string
output: return new string turn an english number zero, one, etc to digit 0 1 etc.

create a hash with keys of english words and values of str digits
for each elment of the hash i'll call gsub and do string substition

=end

def word_to_digit(str)
  number = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3',
          'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7',
    'eight' => '8','nine' => '9' }
  
  number.each do |k, v| 
    str = str.gsub(k, v) 
  end
  str
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'




