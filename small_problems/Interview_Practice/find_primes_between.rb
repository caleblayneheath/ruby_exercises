require 'pry'
=begin
print all primes between two numbers, don't use prime class

definitions: prime number is no multiple aside from itself and one
-only even prime number is 2 and 0?

input: first number and last number, mean to examine all inclusive numbers
output: print prime numbers in in inclusive range of input

get all numbers between num1 and num2 and put in array
winnow numbers in array
iterate through winnowed array
  if prime, print

=end

def find_primes(num1, num2)
  range = (num1..num2).to_a
  range.select! do |int|
    int.odd? || (0..2).include?(int)
  end
  
  range.each do |int|
    p int if is_prime?(int)
  end

end

def is_prime?(num)
  # check divisors from 3 .. square root of num rounded up
  divisors = (3..(num ** 0.5).ceil)
  divisors.each do |divisor|
    return false if (num % divisor).zero?
  end
  true
end

find_primes(3, 10)
find_primes(5, 20)
find_primes(0, 3)