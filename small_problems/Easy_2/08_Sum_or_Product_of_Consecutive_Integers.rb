def positive_nonzero_int(num)
  !num.include?('.') && num.to_i > 0
end

number = 0
loop do
  puts 'Please enter an integer greater than 0:'
  number = gets.chomp
  if positive_nonzero_int(number)
    number = number.to_i
    break
  end
  puts 'Not a valid entry.'
end

puts "Enter 's' to compute the sum, 'p' to compute the product."
choice = gets.chomp

if choice == 's'
  result = (1..number).to_a.inject(:+)
  puts "The sum of the integers between 1 and #{number} is #{result}."
elsif choice == 'p'
  result = (1..number).to_a.inject(:*)
  puts "The product of the integers between 1 and #{number} is #{result}."
else
  puts 'Not a valid operation.'
end