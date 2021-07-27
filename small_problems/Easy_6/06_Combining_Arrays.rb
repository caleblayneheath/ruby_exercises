def merge(arr1, arr2)
  # (arr1 + arr2).uniq

  # Launch School
  # Set union method
  # arr1 | arr2

  array = arr1 + arr2
  result = []
  array.each { |elem| result << elem unless result.include?(elem)}
  result
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
