# def fibonacci(n)
#   return 1 if n <= 2
#   counter = 0
#   first = 1
#   second = 1
#   num = nil
#   while counter < (n - 2) do
#     num = first + second
#     first = second
#     second = num
#     counter += 1
#   end
#   num
# end

# Launch School
def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) { first, last = [last, first + last] }
  last
end


p fibonacci(20) #== 6765
p fibonacci(100) #== 354224848179261915075
p fibonacci(100_001) # => 4202692702.....8285979669707537501