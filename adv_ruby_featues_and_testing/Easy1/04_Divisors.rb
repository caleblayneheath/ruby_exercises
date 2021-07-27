=begin
input: positive integer
output: array containing all divisors of input, no sorting required

range to examine: 1..int
diviros will always include 1 and int
excepting when int == 1, divisors will be in pairs

create empty results array
starting with 1 as poss_div,
  divide int by poss_div
  if output is int
    add poss div  && output to results
  
  return uniqe results  
=end

require 'benchmark'


def divisors(int) # this is faster
  results = []
  (1..((int**0.5).to_i)).each do |num|
    if int % num == 0
      results << num << int / num
    end
  end
  results.sort.uniq

  # (1..int).select { |num| int % num == 0}
end

def divisors2(int)
  results = []
  (1..((int**0.5).to_i)).each do |num|
    divisor = int / num.to_f
    if divisor == divisor.to_i
      results << num << divisor.to_i
    end
  end
  results.sort.uniq

  # (1..int).select { |num| int % num == 0}
end

# p divisors(1)# == [1]
# p divisors(7)# == [1, 7]
# p divisors(12)# == [1, 2, 3, 4, 6, 12]
# p divisors(36)
# p divisors(98)# == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

p Benchmark.realtime() {divisors(99400891)}
p Benchmark.realtime() {divisors2(99400891)}