=begin
input: array (collection?) and block performing operation on element
output: new array of same size as input, where each elem is equal
to return value of the block

create empty results array
iterate through every element of collection
  yield element to block
  results << return value of block
results

=end

def map(collection)
  collection.each_with_object([]) { |elem, arr| arr << yield(elem) }
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({a: 1, b: 2, c:3}) { |_, val| val }