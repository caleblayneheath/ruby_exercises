def stringy(num, start = 1)
  output = ''
  start == 1 ? range = (1..num) : range = (0..num-1)
  range.each { |i| output << ( i % 2).to_s }
  output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'
