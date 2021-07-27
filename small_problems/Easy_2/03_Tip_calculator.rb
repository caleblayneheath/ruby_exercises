puts 'Enter the bill amount:'
bill_amount = gets.chomp.to_f

puts 'Enter the tip rate as a %:'
tip_rate = gets.chomp.to_f / 100

puts "The tip is $#{format('%.2f', bill_amount * tip_rate)}."
puts "The total bill is $#{format('%.2f', bill_amount * (1 + tip_rate))}."