=begin
input: array, wtih block it yields elem and idx to
output: calling array

create index range using arr size
iterate through arr with each
  yield to elem and index
  increment index

=end

def each_with_index(arr)
  # (0...arr.size).each do |idx|
  #   yield(arr[idx], idx)
  # end
  # arr

  idx = 0
  arr.each do |elem|
    yield(elem, idx)
    idx += 1
  end
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]