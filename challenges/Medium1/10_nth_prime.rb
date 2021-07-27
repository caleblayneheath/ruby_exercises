require 'prime'

ERROR_MESSAGE = <<-MSG.freeze
Using Ruby's Prime class is probably the best way to do this in a
'real' application; but this is an exercise, not a real application,
so you're expected to implement this yourself.
MSG

# This code prevents you from using any of the prohibited methods.

class Prime
  [:each, :new, :prime?, :take].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end

  # prime number, no factors other than 1 and itself
  # find nth prime number, 1st is 2, 2nd is 3rd, etc
  # if number less than 1, return ArgumentError
  
  # generate the first n prime numbers then return the last
  # how to generate prime numbers
  #   start with empty array to hold possible primes
  #   see if any primes discovered so far are factors of number
  #     only primes between 2 and squre root of number need be considered
  # 2 3 5 7 11

  def self.nth(number)
    raise ArgumentError if number < 1
    
    primes = [2]
    counter = 3
    until primes.size == number
      primes << counter unless prime_factors?(primes, counter)
      counter += 2
    end
    primes.last
  end

  def self.prime_factors?(primes, number)
    factors = primes.select { |possible| possible <= (number**0.5) }
    factors.any? { |divisor| (number % divisor).zero? }
  end
end

class Integer
  [:prime?, :each_prime].each do |m|
    define_method(m) { |*_| fail ERROR_MESSAGE }
  end
end
