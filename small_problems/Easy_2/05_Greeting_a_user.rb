puts "What's your name?"
name = gets.chomp

if name.chars.last == '!'
  puts "HELLO #{name[0..-2].upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end