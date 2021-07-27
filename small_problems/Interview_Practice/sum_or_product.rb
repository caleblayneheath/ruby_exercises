=begin
goal:
-programs asks user for integer greater than zero
  - prompt user, capture with gets
-then asks if user wants to determine sum or product of all numbers between 1 and the integer
  - prompt user, capture with gets, 's' for sum, 'p' for product
-perform computation
  - generate range of 1 to input integer
  - store result of inject or reduce on range in variable
    -'s' sum
    -'p' product
-then outputs result of the computation
=end
int = 0
loop do
  puts 'Enter an integer greater than zero.'
  int = gets.chomp.to_i
  break if int > 0
end

operation = ''
loop do
  puts "Enter 's' to compute sum, 'p' to compute product."
  operation = gets.chomp
  break if ['s', 'p'].include?(operation)
end

range = 1..int
result = case operation
when 's'
  range.inject(:+)
when 'p'
  range.inject(:*)
end

puts "Result of computation is #{result}."