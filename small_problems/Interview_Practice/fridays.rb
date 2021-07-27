=begin
write a method that returns the number of Friday the 13ths in a given year, which is the arguments

input: year greater than 1752, use modern UK calendar
output: integer number of Friday 13ths in a given year

uses date class of ruby

rules: there is one 13th in every month

for a given year, check whether the 13th day in every month falls on a Friday.

create count of results and initialize to zero
iterate through every month
check that the 13 is Friday using friday?
  if yes, incrmenet counter
return counter

=end

require 'date'
require 'pry'

def num_of_friday13ths(year)
  counter = 0
  (1..12).each do |month|
    counter += 1 if Date.new(year, month, 13).friday?
  end
  counter
end

p num_of_friday13ths(2015) # 3
p num_of_friday13ths(1986) # 1