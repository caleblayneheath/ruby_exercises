=begin
input: array, block which evals to true or false
output: number of times block returns true

set true count to 0
iteration through collection with each
  if yield(elem), increment true count
return true count

=end

# def count(collection)
#   count = 0
#   collection.each { |elem| count += 1 if yield(elem) }
#   count
# end

def count(collection, &block)
  collection.select(&block).size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2