=begin
given a number, find sum of all multiples of some nums 
up to that num

all natural nums up to almost 20 that are mult of 3 or 5
are 3, 5, 6, 9, 10, 12, 15, and 18 and sum up to 78
=end

class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def initialize(*multiples)
    @multiples = multiples.empty? ? DEFAULT_MULTIPLES : multiples
  end

  def to(limit)
    multiples = @multiples
    sum_multiples(multiples, limit)
  end

  # def to(limit)
  #   multiples = @multiples
  #   self.class.sum_multiples(multiples, limit)
  # end

  def self.to(limit)
    self.new.to(limit)
  end

  # def self.to(limit)
  #   multiples = DEFAULT_MULTIPLES
  #   sum_multiples(multiples, limit)
  # end

  private

  def sum_multiples(multiples, limit)
    result = 0
    (1...limit).each do |number|
      if multiples.any? { |multi| (number % multi) == 0}
        result += number
      end
    end
    result
  end

  # def self.sum_multiples(multiples, limit)
  #   result = 0
  #   (1...limit).each do |number|
  #     if multiples.any? { |multi| number % multi == 0}
  #       result += number
  #     end
  #   end
  #   result
  # end
end