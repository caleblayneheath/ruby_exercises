def rotate_array(array)
  array[1..-1] + [array.first]
end

def rotate_rightmost_digits(int, left)
  input = int.to_s.chars
  # my solution
  # (input[0...-left] + rotate_array(input[-left..-1])).join.to_i
  input[-left..-1] = rotate_array(input[-left..-1])
  input.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917