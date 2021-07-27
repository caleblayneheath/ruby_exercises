=begin
input: collection and block
output: elem where block has highest value
empty array should return nil

set large_index to nil
iterate through colleection with each
  yield elem to block
  if return val !nil and larger than collection(large-index)
    set new index
return lareg index

=end

def max_by(collection)

  result = collection.first
  max_return = result ? yield(collection.first) : result

  collection.each do |elem|
    if yield(elem) > max_return
      result = elem
      max_return = yield(elem)
    end
  end
  result

end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil