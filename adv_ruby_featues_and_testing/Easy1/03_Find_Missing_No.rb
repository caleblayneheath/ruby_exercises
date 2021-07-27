=begin
given: sorted array of integers
output: a new array with all the missing integers in order between first and last,
        return [] if array size less than 2

create range using first and last elements of input array
subtract input array from range array

=end

def missing(arr)
  ((arr.first)..(arr.last)).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []