=begin
problem: write a method that take 2 arrays as arguments,
and returns new array containing both elements from arguments,
places in alternation, 1st card of 1st arg, 1st card of 2nd arg, etc.
assume: nonempty arrays, and same number of elements

input: 2 arrays which are nonempty, and equal in size
output: new array with elements of both args, placed alternatively

create empty results array
get size of one array(both are the same doesn't matter which)
for each number in the range of 0 to size-1 (corresponding to indices)
  access arg1 element at index and append to result
  ditto for arg2
return results

=end

def interleave(arr1, arr2)
  results = []
  indices = 0...arr1.size
  indices.each do |index|
    results << arr1[index] << arr2[index]
  end
  results
end

p interleave([1, 2, 3], ['a', 'b', 'c']) #== [1, 'a', 2, 'b', 3, 'c']