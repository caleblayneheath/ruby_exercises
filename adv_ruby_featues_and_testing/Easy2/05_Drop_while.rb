=begin
input: collection, block eval as true or false
output: subsection of collection as new array, 
        starting at first falsey return value for block, then going to end of collection
empty input whould return amepty array

iterate through collection with each_with_index
  yield to block
  if return val of block falsey, return [idx..-1]
return []

=end

def drop_while(collection)
  collection.each_with_index do |elem, idx|
    return collection[idx..-1] unless yield(elem)
  end
  []
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []