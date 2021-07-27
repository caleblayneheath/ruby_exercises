CHARS = ('0'..'9').to_a

def integer_to_string(num)
  results = ''

  loop do
    results << CHARS[num % 10]
    num = num / 10
    break if num == 0
  end

  results.reverse
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'