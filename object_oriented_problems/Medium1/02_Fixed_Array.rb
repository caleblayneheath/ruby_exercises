class FixedArray
  def initialize(max_elements)
    @array = Array.new(max_elements)
  end
  
  def [](index)
    array.fetch(index)
  end
  
  def []=(index, value)
    self[index]
    array[index] = value
  end

  def to_a
    array.clone
  end

  def to_s
    to_a.to_s
  end

  private 
  attr_reader :array
end

# class FixedArray
#   attr_reader :array
  
#   def initialize(num_of_elements)
#     @array = [nil] * 5
#     @valid_idx = populate_valid_idx
#   end

#   def populate_valid_idx
#     size = array.size
#     positive_idx = (0..size - 1).to_a
#     negative_idx = (1..size).to_a.map{ |num| num * -1 }
#     positive_idx + negative_idx
#   end

#   def [](idx)
#     verify_idx(idx)
#     array[idx]
#   end

#   def []=(idx, thing)
#     verify_idx(idx)
#     array[idx] = thing
#   end

#   def verify_idx(idx)
#     return if @valid_idx.include?(idx)
#     raise IndexError.new
#   end

#   def to_a
#     array.dup
#   end

#   def to_s
#     arr = array.map do |elem|
#       if elem.nil?
#         'nil'
#       else
#         "\"#{elem}\""
#       end
#     end
#     '[' + arr.join(', ') + ']'
#   end
# end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end