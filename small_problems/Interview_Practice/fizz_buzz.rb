=begin
rules: every number divis by 3 is fizz, divis by 5 is buzz, divis by both is fizzbuzz
goal: print out every number from 1 to input number, replacing num with fizz/buzz/fizzbuzz as appropriate

input: num - count from 1 to this number, inclusive
output: print output list of numbers with substitions for fizzbuzz

generate range of values from 1 to num
turn range into an array
iterate through and transform array elements according to fizzbuzz rules
  if divis by 3, fizz
  if divis by 5, buzz
  if divis by 3 && 5, fizzbuzz
  else, leave num as is
print array
=end

def fizzbuzz(num)
  values = (1..num).to_a
  values.map! do |int|
    case
    when (int % 5).zero? && (int % 3).zero?
      'fizzbuzz'
    when (int % 5).zero? 
      'buzz'
    when (int % 3).zero?
      'fizz'
    else
      int
    end
  end
  puts values
end

fizzbuzz(15)