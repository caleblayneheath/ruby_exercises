require 'pry-byebug'

# def fibonacci(num)
#   num <= 2 ? 1 : fibonacci(num - 1) + fibonacci(num - 2)
# end

# isn't this just a complicated while loop
def fibonacci_tail(num, accum1, accum2)
  if num == 1
    accum1
  elsif num == 2
    accum2
  else
    #                     
    fibonacci_tail(num - 1, accum2, accum2 + accum1)
  end
end

def fibonacci(num)
  fibonacci_tail(num, 1, 1)
end

# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765