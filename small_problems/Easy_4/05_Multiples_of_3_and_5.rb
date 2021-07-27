def multisum(number)
  # I prefer sum here. Seems more comprehnesible than inject.
  # (1..number).select {|i| i % 3 == 0 || i % 5 == 0}.sum
  (1..number).select {|i| i % 3 == 0 || i % 5 == 0}.inject(:+)

end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168