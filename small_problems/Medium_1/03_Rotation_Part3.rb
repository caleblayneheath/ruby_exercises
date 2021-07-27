require 'pry-byebug'

def rotate_array(array)
  array[1..-1] + [array.first]
end

def rotate_rightmost_digits(int, left)
  input = int.to_s.chars
  (input[0...-left] + rotate_array(input[-left..-1])).join#.to_i

end

def max_rotation(number)
  counter = number.to_s.size 
  result = number
  while counter > 1
    result = rotate_rightmost_digits(result, counter)
    counter -= 1
  end
  # result
  result.to_i
end

p max_rotation(10035) #== 3150
p max_rotation(735291) #== 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845