# def xor?(arg1, arg2)
#   if arg1 == true && arg2 == true
#     return false
#   elsif arg1 == false && arg2 == false
#     return false
#   else
#     return true
#   end
# end

def xor?(arg1, arg2)
  (arg1 && !arg2) || (!arg1 && arg2)
end

puts xor?(5.even?, 4.even?) 
puts xor?(5.odd?, 4.odd?) 
puts xor?(5.odd?, 4.even?) 
puts xor?(5.even?, 4.odd?) 