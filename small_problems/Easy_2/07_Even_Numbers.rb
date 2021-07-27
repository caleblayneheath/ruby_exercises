count = 1
loop do
  puts count if count.even?
  count += 1
  break if count > 99
end