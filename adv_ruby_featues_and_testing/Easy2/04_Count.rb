=begin
input: arbitrary list of args, block
output: number of args where block is true

return 0 if arg list empty

use splat operation to create arg array
select all elems from arg where pass block is true
return size
=end

# def count(*arg, &block)
#   arg.select(&block).size
# end

def count(*arg)
  arg.select { |elem| yield(elem) }.size
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3