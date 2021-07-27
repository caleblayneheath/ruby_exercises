count = 1
results = []
loop do
  puts "Enter number ##{count}"
  number = gets.chomp.to_i
  results << number
  count += 1
  break if (count > 6)
end

if results[0..-2].include?(results.last)
  puts "The number #{results.last} appears in #{results[0..-2]}." 
else
  puts "The number #{results.last} does not appear in #{results[0..-2]}." 
end