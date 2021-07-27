NUMBERS = %w(zero one two three four five six seven eight nine ten)
OPERATORS = %w(plus minus times divided)

=begin
generate randoms english math problems with a method

input: number of operations
output: string consisting of english_num OPERATOR english_num, etc.

rules: if 1 op, need 2 nums
if 2 ops, need 3 nums
if 3, ops need 4 nums
  SO NEED NUMS equal to to number of operations + 1

create empty result array
create array of randomly selected numbers equal to num of operations + 1
create array of randomly selected operations equal to num of operations

create range of numbers from zero to number of operations - 1 to serve as indices
create loop
  pop a number to results
  pop an operator
  do this until the operator array is empty and there is one element left in results
pop last number element into results array
join array and return

=end

def mathphrase(num_operations) 
  numbers = []
  (num_operations+1).times do |num|
    numbers << NUMBERS.sample
  end

  operations = []
  (num_operations).times do |num|
    operations << OPERATORS.sample
  end

  results = []
  loop do
    results << numbers.pop 
    results << operations.pop
    break if operations.empty?
  end

  results << numbers
  results.join(' ').gsub('divided', 'divided by')
end

def rand_length_phrase
  mathphrase(rand(1..20))
end

p mathphrase(1)
p mathphrase(2)
p rand_length_phrase