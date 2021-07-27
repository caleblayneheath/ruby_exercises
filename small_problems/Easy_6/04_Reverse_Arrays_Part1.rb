def reverse!(arry)
  counter = 0
  # loop do
  #   arry.insert(counter, arry.pop)
  #   counter += 1
  #   break if (counter >= (arry.size - 1))
  # end

  while counter < arry.size do
    arry.insert(counter, arry.pop)
    counter += 1
  end
  arry

  # Launch School solution
  # left_index = 0
  # right_index = -1

  # while left_index < arry.size / 2
  #   arry[left_index], arry[right_index] = arry[right_index], arry[left_index]
  #   left_index += 1
  #   right_index -= 1
  # end
  # arry

end

p list = [1,2,3,4]
p result = reverse!(list)
p result == [4, 3, 2, 1]
p list == [4, 3, 2, 1]
p list.object_id == result.object_id
puts
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"]
p list == ["c", "d", "e", "b", "a"]
puts
p list = ['abc']
p reverse!(list) == ["abc"]
p list == ["abc"]
puts
p list = []
p reverse!(list) == []
p list == []