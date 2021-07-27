num2 = 0
loop do
  puts 'Enter the first positive integer.'
  num1 = gets.chomp.to_f
  break unless num1 < 0
end

num2 = 0
loop do
  puts 'Enter the second positive integer (must not be zero).'
  num2 = gets.chomp.to_f
  break unless num2 <= 0
end

puts "#{num1} + #{num2} = #{num1 + num2}"
puts "#{num1} - #{num2} = #{num1 - num2}"
puts "#{num1} * #{num2} = #{num1 * num2}"
puts "#{num1} / #{num2} = #{num1 / num2}"
puts "#{num1} % #{num2} = #{num1 % num2}"
puts "#{num1} ** #{num2} = #{num1 ** num2}"