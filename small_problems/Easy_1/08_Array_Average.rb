# def average(list)
#   list.sum / list.size
# end

def average(list)
  list.reduce(:+) / list.size
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
puts average([1, 2.4, 5, 3.3])
