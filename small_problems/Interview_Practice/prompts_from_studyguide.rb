=begin
select the element out of the array if its index is a fibonacci number

input: arr of size 1 or greater
output: selected array of all elements out of the array IF the index is a fibonacci number

iterate through index values for input array
  range 0...arr.size
  
find all fib numbers in range of indices first
  generate fib numbers that qualify
  
if index value is fib number, select corresponding elment for results
return results 



1 1 2 3 5 8 13 21 . .  
=end

def select_fib_indices(arr)
  results = []
  arr.each_with_index do |elem, idx|
    results << elem if in_fib_num_range?(idx, arr.size - 1)
  end
  results
  
end


=begin
first 2 nums are 1
then it's add two previous
=end

def in_fib_num_range?(num, last)
  return true if num == 1
  
  fib_nums = []
  
  num1 = 1
  num2 = 1
  fib = 0
  loop do
    fib = num1 + num2
    fib_nums << fib
    num1 = num2
    num2 = fib
    break if fib >= last
  end
    
  fib_nums.include?(num)
end


p select_fib_indices(%[a b c d e f g h i j k].split)


=begin
write a method to determine if a word is a palindrome, without using the reverse method

input: string, a single word
output: true if palindrome, else false

CANOT USE REVERSE
palindrome definition
-exact case match forward and back

build a reversed string manually than compare with inptu

create empty result string
get size of input string
for range 1..size
  access str[-range] and append to result string

then compare result to original string

=end


def palindrome?(str)
  reverse = ''
  (1..str.size).each do |idx|
    reverse << str[-idx]
  end
  str == reverse
  
end

p palindrome?('abba') == true

p palindrome?('Abba') == false

