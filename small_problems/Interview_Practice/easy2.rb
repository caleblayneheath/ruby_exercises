=begin
goal: program randomly generates Teddy's age (which is between 20 and 200)

input: none
output: to screen: Teddy is ___ years old!

string interporlation
(20..200).sample
=end

puts "Teddy is #{(20..200).to_a.sample} years old!"
=end

=begin

program should
-ask user for length and width of room in meters
-then output area of room in square meters and square feet

input does not need validation

prompt user for length of room in meters
store lengeth
prompt user for width of room in meters
store width

calculate area in square meters
calculate area in square feet
output both areas

=end

puts "Enter length of room in meters."
length = gets.chomp.to_f

puts "Enter width of room in meters."
width = gets.chomp.to_f

area_metric = length * width
area_imp = (area_metric * 10.7639).round(2)

puts "The area of the room is #{area_metric} square meters (#{area_imp} square feet)."

=begin
write tip calculator

prompt for bill amount and tip rate (15%)
compute tip
display tip and total amount of the bill

prompt for bill amount
get bill amount from user, convert to float
prompt for tip rate
get tip rate from user, convert to float
compute tip
  bill amount * (tip rate converted to decimal, tip rate / 100)
display tip and total bill
=end

puts "Enter bill amount."
bill = gets.chomp.to_f

puts "Enter tip rate in xx%."
tip_rate = gets.chomp.to_f

tip = bill * (tip_rate / 100)

puts "The tip is $#{tip} and the bill is $#{bill}."

=begin
program display when user will retire, and how many years remain till retirement

asks age
store age as int
asks at what age user wants to retire
store retire_age as int

retire_age - age = num_work_years_left
retire_year = num_workyearsleft + current year

displays year of retirement
displays number of working years left

=end

puts "Enter your age"
age = gets.chomp.to_i

puts "Enter age you want to retire at."
retire_age = gets.chomp.to_i

years_left = retire_age - age
current_year = Time.now.year
retire_year = current_year + years_left

puts "You will retire in #{retire_year} after #{years_left} more years."

=begin

ask for user's name
greet user
if name!
greet user yellingly

prompts to enter name
get name
check if name was yelled
  yelled if last char in string was !
if yelled
  greet user in all caps
else
  greet user normally


=end

puts "Enter your name."
name = gets.chomp

greeting = "Hello #{name[0..-2]}"

puts name[-1] == '!' ? greeting.upcase : greeting

=begin
print all odd numbers 1 to 99 inclusive on separte lines

iterate over range of 1..99
  if odd, print

=end

(1..99).each { |num| puts num if num.odd? }

=begin
asks user to enter integer greater than 0
asks user if it wants sum or product of all numbers inclusive

prompt user for integer greater than 0
store int
asks user to sum or product all numbers in range 1..int
store value sum or product

generate array of all nums in range 1..int
if sum, sum up all numbers in array, using sum
if product, use inject to multiply all numbers

display result

=end

puts "Enter an integer greater than 0."
num = gets.chomp.to_i

puts "Choose 's' to sum all numbers between 1 and the integer (inclusive), or 'p' to multiply them."

operation = gets.chomp

numbers = (1..num).to_a

result = if operation == 's'
           numbers.sum
         elsif operation == 'p'
           numbers.inject(:*)
         end

puts "The result of the operation is #{result}."