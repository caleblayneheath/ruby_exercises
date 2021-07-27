=begin
input: start int, ending end, step value for each iteration, block which yields iterations
output: array of step values

set iteration val equal to startval
while itval < endval
  yield itval
  add itval to results array
  increment itval by stepval
end

=end

def step(start, finish, step)
  results = []
  current = start
  while current <= finish
    yield(current)
    results << current
    current += step
  end
  results
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
