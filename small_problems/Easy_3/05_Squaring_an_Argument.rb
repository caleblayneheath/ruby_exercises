def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

def power_of(num, power)
  if power == 0
    return 1
  else
    return multiply(num, power_of(num, power - 1))
  end
end

puts square(5) == 25
puts square(-8) == 64
puts power_of(3, 0)
puts power_of(3, 1)
puts power_of(3, 2)
puts power_of(3, 3)