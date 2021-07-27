=begin
input: float, angle between 0 and 360 degrees
output:string representing float converted into angle-degree-minute format
format for minutes and seconds should be two digits, pad with lead zeroes if needed


circle has 360 degrees
1 degree = 60 minutes
1 minute = 60 seconds

get degree
  angle.to_i
get remainder from degree
    angle % angle.to_i
get minute
  degrees * (60 minutes / 1 degrees)
  (degrees * 60).to_i # this gets minute, still need remainder for second
get remainder from minute
  minute % minute.to_i
get second
  (minute * 60).round # this gets minute, still need remainder for 


=end

DEGREE = "\xC2\xB0"

def dms(angle)
  return "0#{DEGREE}00'00\"" if (angle % 360).zero?
  
  degree = angle.to_i
  
  minute = ((angle % angle.to_i) * 60).round(2)
  
  if minute.zero?
    second = 0
  else
    second = ((minute % minute.to_i) * 60).round
  end

  
  "#{degree}#{DEGREE}#{pad_num(minute.to_i)}'#{pad_num(second.to_i)}\""

  
end

def pad_num(num)
  if num.to_s.length < 2
    '0' + num.to_s
  else
    num.to_s
  end
end


puts dms(30) #== %(30°00'00")
p dms(76.73) #== %(76°43'48")
p dms(254.6) #== %(254°36'00")
p dms(93.034773) #== %(93°02'05")
p dms(0) #== %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

=begin
input: array of strings
output: array with same string values, but vowels (aeiou-case insenstive) removed from those strings

transform array of strings
  return vowelless version of each string
    delete('aeiouAEIOU')

=end

def remove_vowels(arr)
  arr.map{ |str| str.delete('aeiouAEIOU') }
  
end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

=begin
fib definition
first two numbers are 1 and 1
  then every subsequent numnber is sum of previous 2 numbers in series
  1, 1, 1 + 1, 1 + 1 +1
  1, 1, 2, 3, 5, 8, etc
  
  which index (position in the sequence) of the fib number has a number of digits as specified in the argrument
  
  input: integer, number of digits in the desired fib number
  output: integer, index of the number (1st num, 2nd num, etc) that has the number of digits specified by input
  
  
  return 1 if input is one
  index = 7
  num1 = 5
  num2 = 8
  
  
  fib_number = num1 + num2
  digit_num = fib_number.to_s.size
  return index if digit_num == input
  
  index += 1
  num1 = num2
  num2 = fib_number

  determine number of digits in given fib number
  return index one number of digits is equal to input

=end

def find_fibonacci_index_by_length(digits)
  return 1 if digits == 1
  
  index = 7
  num1 = 5
  num2 = 8
  loop do
    fib_number = num1 + num2
    digit_num = fib_number.to_s.size
    return index if digit_num == digits
    
    index += 1
    num1 = num2
    num2 = fib_number
    
  end  
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847


=begin

reverse an array without using referve methods
mutate the caller, return the original array but reversed


[1, 2, 3]

 -3    -1
    -2


[1, 2, 3, 4, 5]

-5 -4 -3  -2  -1

break when right index equal to -(1 + array.size/2)

return array if array.size <= 1

left_idx = -array.size
right_idx = -1
loop do
  array[lft_idx], array[right_idx] = array[right_idx], array[lft_idx]

end


=end

def reverse!(array)
  return array if array.size <= 1
  
  left_idx = -array.size
  right_idx = -1
  
  loop do
    break if right_idx == -(1 + array.size/2)
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
    right_idx += -1
    left_idx += 1
  end
  array
end


# list = [1,2,3,4]
# result = reverse!(list)
# p result == [4, 3, 2, 1]
# p list == [4, 3, 2, 1]
# p list.object_id == result.object_id

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"]
# p list == ["c", "d", "e", "b", "a"]

# list = ['abc']
# p reverse!(list) == ["abc"]
# p list == ["abc"]

# list = []
# p reverse!(list) == []
# p list == []

=begin
given an array, return a reversed copy(new) array

don't mutate the original, don't use reverse or !

create new result array
iterate through input array
  prepend each element from input to result

=end

def reverse(array)
  result = []
  array.each do |elem|
    result.unshift(elem)
  end
  result
end



a= [1,2,3,4]
p reverse(a) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p a

puts
list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

=begin
  input: two arrays
  output: new array that contains all unique elements from the two inputs
  
  add the 2 arrays into 1
  return only uniqe elements

=end

def merge(arr1, arr2)
  # (arr1 + arr2).uniq
  arr1|arr2
end

p merge([1, 3, 5], [3, 6, 9]) #== [1, 3, 5, 6, 9]

=begin
input: an array
output: 2 arrays within an array,
1st array contains first half of input
  middle number should go in first array
  an array of 1 elemnt should have its one elment in first half
2nd array contains latter half of input

  [1, 2, 3, 4]
  
  [0...4/2] [4/2..-1]


  [1, 2, 3, 4, 5]
  
  [0...4/2] [4/2..-1]

=end

def halvsies(arr)
  middle = (arr.size / 2.0).ceil
  # middle += 1 if arr.size.odd?
  [arr[0...middle], arr[middle..-1]]
  
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

=begin
input: given an unordered array where one value occurs twice
output: return the value which occurs twice

get uniq values of array
sort uniq values by count of occurences in orig array
return max of sorted uniq values

=end

def find_dup(array)
  array.uniq.sort_by{ |elem| array.count(elem) }.last
  
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

=begin
input: an array, search_value
output: true if search_value in array, else false

don't use INCLUDE


iterating through every uniq value of the array
if input == elem, return true

else false

=end

def include?(arr, search)
  arr.uniq.each { |elem| return true if elem == search }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

=begin
input: positive integer

output: print a right triangle whose sides have input stars

triangle should have right angle in bottom right corner
other corners in bottom left and top right

*

 *
** 

num of stars starts at 1, increments up to input
rjust starts at input, increments down to 1
stop when num of stars == input

              ('*' * input-1).rjust(2)
bottom line = ('*' * input).rjust(1)


=end

def triangle(input)
  (1..input).each do |stars|
    p ('*' * stars).rjust(input)
  end
  
end

triangle(0)