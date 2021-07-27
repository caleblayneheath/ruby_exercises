def featured(num)
  count = num + 1
  count += 1 until divisible_by_seven_and_odd?(count)
  
  # loop do
  #   count += 1
  #   break if divisible_by_seven_and_odd?(count)
  # end
  
  loop do
    break unless in_max_featured_range?(count)
    return count if all_digits_unique?(count)
    count += 14
  end
  
  'ERROR: NO NEXT FEATURED NUMBER'
  
end

def divisible_by_seven_and_odd?(num)
  divisible_by_seven?(num) && num.odd?
end

def divisible_by_seven?(num)
  num % 7 == 0
end

def all_digits_unique?(num)
  num_string = num.to_s.chars
  num_string.size == num_string.uniq.size
end

def in_max_featured_range?(num)
  num >= 0 && num <= 9876543210
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35 
p featured(997) == 1029
p featured(1029) == 1043 
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements