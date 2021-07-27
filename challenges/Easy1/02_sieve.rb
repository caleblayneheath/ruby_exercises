=begin
input: number(limit) from instance
output: array of all primes from 0 to number

create a range going from 2 to the limit, some of these are primes

repeat the following
  move to next unmarked number (this number is prime)
    add it to a result
  reject out all the multiples of that number (which are not prime)
=end

class Sieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  # def primes
  #   range = (2..limit).to_a
  #   result = []
  #   until range.empty?
  #     result << range.shift
  #     range.reject! { |num| num % result.last == 0}
  #   end
  #   result
  # end

  # little faster than mine
  def primes
    numbers = (2..limit).to_a
    primes = []
    # is true and assigns deleted list front to prime
    while (prime = numbers.delete_at(0)) 
      primes << prime
      numbers.delete_if { |number| number % prime == 0 }
    end
    primes
  end

end