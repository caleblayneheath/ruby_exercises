DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
}

# def string_to_signed_integer(string)
#   digits = string.chars
#   sign = ''
#   if digits.first == '+' || digits.first == '-'
#     sign = digits.shift
#   end

#   digits.map! { |i| i = DIGITS[i] }

#   results = 0
#   digits.each { |digit| results = 10 * results + digit }

#   if sign == '-'
#     results *= -1
#   end

#   results
# end

def string_to_integer(string)
  digits = string.chars.map { |i| i = DIGITS[i.downcase] }
  results = 0
  digits.each { |digit| results = 10 * results + digit }
  results
end

def string_to_signed_integer(string)
  # case string[0]
  # when '+' then string_to_integer(string[1..-1])
  # when '-' then -string_to_integer(string[1..-1])
  # else string_to_integer(string)
  # end  

  eval_string = "string_to_integer"
  if string[0] == '+' || string[0] == '-'
    eval_string = string[0] + eval_string + '(string[1..-1])' )
  else
    eval_string = eval_string + '(string)'
  end
  eval(eval_string)
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100