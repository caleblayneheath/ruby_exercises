=begin
input: string of digits, a length n
output: all consecutive number series of length n in string
output should be  in arrays of arrays

01234, 3
012, 123, 234

01234, 4
0123, 1234

if n is larger than string, return nil?
=end

class Series
  attr_reader :digits
  
  def initialize(string)
    @digits = string.chars.map(&:to_i)
  end

  def slices(slice_length)
    raise ArgumentError if slice_length > digits.size
    # result = []
    # digits.each_cons(slice_length) do |slice| 
    #   result << slice
    # end
    # result

    # result = []
    # (0..(digits.size - slice_length)).each do |index|
    #   result << digits[index, slice_length]
    # end
    # result

    digits.each_cons(slice_length).to_a
  end
end