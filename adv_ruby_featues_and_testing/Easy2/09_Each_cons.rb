=begin
input: array argument, block
output: nil

each consectuvie pairs of the input array should be passed to the block

while array is not empty
  shift 2 elems from array into temp array
  yield first and last of temp array to block
=end

def each_cons(arr)
  (0...arr.size-1).each { |idx| yield(arr[idx], arr[idx+1]) }
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil