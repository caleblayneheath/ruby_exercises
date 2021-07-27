def char_to_digit(char)
  case char
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  end
end

def string_to_integer(str)
  digits = str.chars
  
  power_of_ten = digits.size - 1
  total = 0
  digits.each do |i|
    total += (char_to_digit(i) * (10 ** power_of_ten))
    power_of_ten -= 1
  end
  total
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570



##################################################

HEX_DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15
}

def hexadecimal_to_integer(string)
  digits = string.chars.map { |i| i = HEX_DIGITS[i.downcase] }
  results = 0
  digits.each { |digit| results = 16 * results + digit }
  results
end

p hexadecimal_to_integer('4D9f') == 19871
p hexadecimal_to_integer('10e1') == 4321
p hexadecimal_to_integer('23A') == 570
 