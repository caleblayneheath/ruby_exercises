def interleave(arr1, arr2)
  # [arr1, arr2].transpose.flatten

  # Further Exploration
  arr1.zip(arr2).flatten

  # counter = 0
  # result = []
  # while counter < arr1.size do
  #   result << arr1[counter]
  #   result << arr2[counter]
  #   counter += 1
  # end
  # result

  # Launch School
  # result = []
  # arr1.each_with_index do |elem, idx|
  #   result << elem << arr2[idx]
  # end
  # result


end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']