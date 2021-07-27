def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

=begin
There is a flaw on line 5. The statement being evaluted for the ternary operator is the truthiness
of the initialiazation of a variable odd_count and its assignment to the integer object 3. 3 is truthy,
which means it evaluates to true, which means that line 5 will always have a return value of true,
and thus the method will always return true as long as nums is equal to 47.
To fix this, change the assignment to equivalence like so odd_count == 3 ? true : false
In fact, the ternary operator is unnescearry.
=end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false