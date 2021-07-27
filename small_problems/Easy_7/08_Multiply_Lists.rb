def multiply_list(arr1, arr2)
  # result = []
  # arr1.each_with_index do |elem, idx|
  #   result << elem * arr2[idx]
  # end
  # result

  arr1.zip(arr2).map{ |arr| arr.inject(&:*) }
end

# from lewis reynolds, the with_index method
# def multiply_list(arr1, arr2)
#   arr1.map.with_index { |elem, index| elem * arr2[index] }
# end 

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
