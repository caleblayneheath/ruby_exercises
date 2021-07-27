def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

def compute2(arg)
  block_given? ? yield(arg) : "Input '#{arg}' does not compute."
end

p compute2(3) { |i| 5 + 3 + i } == 11
p compute2('c') { |a| 'a' + 'b' + a} == 'abc'
p compute2(3)