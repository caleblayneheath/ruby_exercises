def include?(array, search)
  array.each { |elem| return true if elem == search}
  false

  # Launch School
  # !!array.find_index(search)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false