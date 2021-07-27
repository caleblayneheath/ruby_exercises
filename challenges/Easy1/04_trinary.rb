class Trinary
  attr_reader :tri_num

  def initialize(num_string)
    @tri_num = num_string
  end

  def to_decimal
    return 0 if tri_num.match(/[^0-2]/)
    # return 0 unless tri_num.count('012') == tri_num.size

    # tri_num.chars.reverse.map.with_index do |num, index|
    #   num.to_i * 3 ** index
    # end.sum

    # don't know how this works
    @tri_num.chars.inject(0) { |sum, num| (sum + num.to_i) * 3 } / 3

  end
end