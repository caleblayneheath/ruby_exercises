# a number which is the sum of it's divisors, is perfect
# no prime can be perfect
# abundant : sum of factors > number
# deficient : sum of factors < number

# negative numbers raise runtime errors

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number < 0
    sum_of_factors = factors(number).sum
    
    # 1 is defined as deficient
    case
    when (number == 1 || (sum_of_factors < number))
      'deficient'
    when sum_of_factors > number
      'abundant'
    when sum_of_factors == number
      'perfect'
    end
  end

  def self.factors(number)
    factors = []
    possibles = (2..(number**0.5))
    possibles.each do |multiple|
      if number % multiple == 0
        factors << multiple << number/multiple
      end
    end
    factors.uniq << 1
  end
end