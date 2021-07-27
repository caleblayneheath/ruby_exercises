class Octal
  attr_reader :oct_num
  
  def initialize(num_string)
    @oct_num = num_string
  end

  # returns decimal conversion as int from octal
  # check if non digit chars present, return 0 if so

  #create accum of zero
  # convert num_string to array of nums
  # reverse num_string
  # for each element in num_string
    # multiply digit by 8^index
    # add result to accum
  # return accum
  def to_decimal
    accum = 0
    return accum if oct_num.index(/[^0-7]/)

    digits = oct_num.chars.map(&:to_i).reverse
    # digits.each_with_index do |num, index|
    #   accum += ( num * (8 ** index) ) 
    # end
    # accum

    digits.map.with_index { |num, index| num * 8 ** index} .sum
  end

end