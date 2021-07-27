CHARS = ('0'..'9').to_a

# def signed_integer_to_string(num)
#   results = ''

#   positive = num.abs == num
#   work_num = num.abs

#   loop do
#     results << CHARS[work_num % 10]
#     work_num = work_num / 10
#     break if work_num == 0
#   end

#   results.reverse!

#   if num == 0
#     results
#   elsif positive
#     results.prepend('+')
#   else
#     results.prepend('-')
#   end
#   results
# end

def integer_to_string(num)
  results = ''

  loop do
    results << CHARS[num % 10]
    num = num / 10
    break if num == 0
  end

  results.reverse
end

def signed_integer_to_string(num)
  result = integer_to_string(num.abs)
  case num <=> 0
  when -1 then result.prepend('-')
  when +1 then result.prepend('+')
  else result
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'