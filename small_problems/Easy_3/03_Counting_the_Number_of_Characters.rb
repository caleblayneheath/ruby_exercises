puts 'Please type a word or multiple words:'
input = gets.chomp

char_count = 0
input.chars.each { |char| char_count += 1 if char != ' '}
puts "There are #{char_count} letters in \"#{input}.\""