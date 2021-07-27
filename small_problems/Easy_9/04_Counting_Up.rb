# counts away from zero
def sequence(num)
  (1..num.abs).to_a.map { |i| num < 0 ? i * -1 : i }
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(1)
p sequence(-5)
p sequence(0)