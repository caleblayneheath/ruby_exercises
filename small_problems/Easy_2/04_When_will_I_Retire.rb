puts 'What is your age?'
age = gets.chomp.to_i

puts 'At what age would you like to retire?'
retire_age = gets.chomp.to_i

years_remaining = retire_age - age
current_year = Time.now.year

puts "It's #{current_year}. You will retire in #{current_year + years_remaining}."
puts "You have only #{years_remaining} years of work to go!"