def oddities(arry)
  results = []
  arry.each_with_index { |elem, idx| results << elem if idx.even?}
  results
end

def evenites(arry)
  results = []
  arry.each_with_index { |elem, idx| results << elem if idx.odd?}
  results
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []