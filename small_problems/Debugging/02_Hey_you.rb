=begin
The chars method is called by the array object name to produce a new array
consisting of the characters in the string. This new array then calls the each method
and passes a block that mutates each character in the new array to be upcase.
However, this doesn't affect the original string name, only the array created by invoking
chars.

One method to solve this is to assign the results of the line to a variable, either name or a new one,
join the chars into a string by invoking join on the array, and concatenating that with 'HEY'.
=end

def shout_out_to(name)
#   name.chars.each { |c| c.upcase! }
  puts 'HEY ' + name.chars.each { |c| c.upcase! }.join
end
  
  shout_out_to('you') # expected: 'HEY YOU'