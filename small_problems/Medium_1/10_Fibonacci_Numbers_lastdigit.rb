FIB_LAST_DIGIT_PATTERN = [1, 1, 2, 3, 5, 8, 3, 1, 4, 5, 9, 4, 3, 7, 0, 7, 7, 4, 1, 5, 6, 1, 7, 8, 5, 3, 8, 1, 9, 0, 9, 9, 8, 7, 5, 2, 7, 9, 6, 5, 1, 6, 7, 3, 0, 3, 3, 6, 9, 5, 4, 9, 3, 2, 5, 7, 2, 9, 1, 0]

def fib_last_fast(num)
  FIB_LAST_DIGIT_PATTERN[(num - 1) % 60]
end


# Launch School
def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) { first, last = [last, first + last] }
  last
end

# naive
# def fibonacci_last(num)
#   fibonacci(num).to_s[-1].to_i
# end

def fibonacci_last(num)
  first, last = [1, 1]
  3.upto(num) { first, last = [ last, (first + last) % 10] }
  last
end

def generate_last_digits(num)
  result = []
  1.upto(num) { |i| result << fibonacci_last(i) }
  result
end

def fib_pattern_calc(num)
  comparison = []
  last_digits = generate_last_digits(num)
  
  last_digits.each_with_index do |n, index|
    if last_digits[index...(index + comparison.size)] == comparison && comparison.size > 1
      return comparison
    end
    comparison << n
  end
end


# p fibonacci_last(15)        # -> 0  (the 15th p fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th p fibonacci number is 6765)
# p fibonacci_last(100)       # -> 5 (the 100th p fibonacci number is 354224848179261915075)
# p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fib_last_fast(123456789) # -> 4