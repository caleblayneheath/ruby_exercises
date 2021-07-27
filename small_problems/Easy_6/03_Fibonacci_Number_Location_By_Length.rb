def find_fibonacci_index_by_length(num_digits)
  index = 7
  fib_sequence = [5, 8, 13]
  loop do
    if fib_sequence.last.to_s.length == num_digits
      return index
    else
      index += 1
      fib_sequence.shift
      fib_sequence << fib_sequence.sum
    end
  end
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847