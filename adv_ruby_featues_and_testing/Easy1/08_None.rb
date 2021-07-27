=begin
input: array or similar collection
output: true if no block returns true

empty array should always return true
stops once a block returns true

return false once any block returns true
=end

def any?(arr)
  arr.each { |elem| return true if yield(elem) }
  false
end

def none?(collection, &block)
  !any?(collection, &block)
end

# def none?(collection)
#   collection.each { |elem| return false if yield(elem)}
#   true
# end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true