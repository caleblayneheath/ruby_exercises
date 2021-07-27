
=begin
input: string
output: true if the string can be made with all of the linked blocks
flase otherwise


blocks
B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

create a collection holding the blocks
  ['BO', 'GT', 'RE' ]
for each letter in the string
  check if block is in collection
    block.include?(char.upcase)
    if yes? remove block with delete
    if no, return false
    
return true after every letter has been examined


=end

def block_word?(str)
  blocks = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)
  
  str.each_char do |char|
    block_to_delete = ''
    blocks.each do |block|
      block_to_delete = block if block.include?(char.upcase)
    end
    blocks.delete(block_to_delete)  
    return false if block_to_delete == ''
  end
  
  true
end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

=begin
input: string of at least one char
output: hash of format { lowercase: %, uppercase: %, neither: % } 
round to one demical place

get count of string size

for each char in the string
  see if char in lowercase alphabet
    yes: incrmenet lowercase count
  see if char in uppercase alphabet
    yes: incrmenet lowercase count


get count of neithers
  total size - upper and lowercases

calculate percentages to put in the hash
  (( count / size) * 100).round(1)


=end

def letter_percentages(str)
  down_alpha = ('a'..'z').to_a.join
  up_alpha = down_alpha.upcase
  
  total = str.size
  up_count = 0
  down_count = 0
  
  str.each_char do |char|
    up_count += 1 if up_alpha.include?(char)
    down_count += 1 if down_alpha.include?(char)
  end
  
  neither_count = total - up_count - down_count
  
  {lowercase:to_percentage(down_count, total) , uppercase:to_percentage(up_count, total) , neither:to_percentage(neither_count, total) }
    
end

def to_percentage(num, div)
  ((num / div.to_f) * 100)
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }


=begin
input: string
output: true if all parens are matching, false otherwise

all balanced parens start with ( and are balanced by )
) can never occur first
you must equal numbers of ( and )
if there are ever more right parens at any given minute, not valid

set count to one
for each char in the string
  for each (
    we add one to a counter
  for each )
    we remove one from the counter
  if count ever goes below zero in loop
    return false

at end return true if count is zero


=end

def balanced?(str)
  count = 0
  str.each_char do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if count < 0
  end
  count == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false


=begin
input: 3 numbers, each the length of a triangle side
output: symbol showing triangle type by side length, or invalid

triangle rules
sum of two shortest sides must be longer than the longest side
all sides must be greater than 0

equilater rules
all sides are same length

isoc rules
two sides are same length

scalene
valid and not isoc or equilateral


check if triangle valid
  if no, return invalid
  if yes,
    
    check to see if equil, isoc or scalene
      if 1 uniq value, equal
      if 2 uniq values, isoc
      else scalene

=end


def triangle(s1, s2, s3)
  sides = [s1, s2, s3].sort
  
  return :invalid if sides.include?(0) || sides[0..1].sum <= sides.last
  
  case sides.uniq.size
  when 1 then :equilateral
  when 2 then :isoceles   
  when 3 then :scalene  
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5) #== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid



=begin
input: 3 nums which are angles of a triangle
output: symbol showing if tri is acutre right obtuse or invalid

valid angles
  sum to 180 && greater than 0

acute
  if all angles are less than 90
  
obtuse
  if one angle is greater than 90
  
right
  if one angle is 90


=end


def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  
  return :invalid unless angles.sum == 180 && angles.all?{ |a| a > 0}
  
  case
  when angles.all? { |a| a < 90 }
    :acute
  when angles.count(90) == 1
    :right
  else
    :obtuse
  end
  
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


=begin
input: integer
output: next featured number
OR
an error if there is none

featured number is an 
-odd number
-multiple of 7
-only one instance of any given digit occurs
  turn num to string
  split string into chars
  get uniq value of chars array
  if size difference between uniq and original char array, false
  
no featured number could be greater than 9_876_543_210


start at input+1, then check that number and every number up to the featured number limit
  return the first number that triggers true for all favored number args
  
else return false

=end

def featured(num)
  return 'error' if num > 9_876_543_210
  
  range = (num+1)..9_876_543_210
  range.each do |int|
    return int if featured_num?(int)
  end
  'error num too large'
end

def featured_num?(num)
  num.odd? && (num % 7 == 0) && uniq_digits?(num)
end

def uniq_digits?(num)
  arr = num.to_s.chars
  arr.size == arr.uniq.size
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements


=begin
input: an array of at least two elements to be sorted
output: the mutated sorted array

bubble sort

create swap flag, set to false
loop through array making comparisons
(range of left indices is 0..-2 (size of arr -2),  last comparison is -2 to -1)
in range of 0..(arr.size-2)
  compare arr[num] to arr[num+1}

  compare left to right
    if left > right, swap positions (can use e1, e2 = e2, e1)
      and set swap flag to true
  break loop if swap is false
  
=end

def bubble_sort!(arr)
  indices = 0..(arr.size-2)
  loop do
    swap = false
    indices.each do |idx|
      if arr[idx] > arr[idx+1]
        arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
        swap = true
      end
    end
    break unless swap
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

=begin
input: num
output:

for range 1..input
(sum of range)^2 - (range^2)summmed

=end

def sum_square_difference(num)
  ((1..num).sum**2) - (1..num).map{|i|i**2}.sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150


=begin
input: float representing an angle in degrees
output: string representation angle in degrees, minutes, seconds format

360 degrees in a circle
1 degree = 60 mins
1 min = 60 sec

get degrees
  justify everything to 360, range is 0 to 359
  (angle % 360)
  deg = angle / angle.to_i
get minutes
  convert degree remainder into minutes
  multiply deg_rem * 60 to get minutes

get seconds
  multiply min_remain *60

format degrees, min, sec


divmod results
[divident, remainder]

=end

DEGREE = "\xC2\xB0"
def dms(angle)
  angle = angle % 360
  degree, degree_remainder = angle.divmod(1)
  
  minute = (degree_remainder * 60).round(2) # may have to round more or less
  minute, minute_remainder = minute.divmod(1)
  
  second = (minute_remainder * 60).round
  
  
  "#{degree}#{DEGREE}#{pad_num(minute)}'#{pad_num(second)}\""
end

=begin
take num, turn to string
if str size == 1
return '0'+num_str
=end

def pad_num(num)
  num_str = num.to_s
  num_str.size == 1 ? ('0' + num_str) : num_str
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

