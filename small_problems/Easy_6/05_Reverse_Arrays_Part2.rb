def reverse(array)
  work_array = Array.new(array)
  if work_array.size <= 1
    work_array
  else
    [work_array.pop] + (reverse(work_array))
  end

  # Launch School
  # result = []
  # array.reverse_each { |elem| result << elem }
  # result

  # Further Exploration
  # array.each_with_object([]) { |elem, result| result.unshift(elem)}

end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
puts 
p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true