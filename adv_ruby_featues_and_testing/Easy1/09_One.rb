=begin
input: collection
output: true if true for exactly one element

return false upon second true
empty array are false

return false if collection empty at beginning
set a true count to zero
use each to iterate through collection
  return false if true count greater than 1
return true

=end

def one?(collection)
  true_count = 0
  collection.each do |elem|
    true_count += 1 if yield(elem)
    return false if true_count > 1
  end
  
  true_count == 1
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false