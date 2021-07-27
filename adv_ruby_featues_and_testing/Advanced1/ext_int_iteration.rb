# external iteration
enum = Enumerator.new do |yielder|
  num = 0 # a!
  accum = 1 #
  loop do
    yielder << accum
    num += 1
    accum *= num
  end
end

7.times {p enum.next}
enum.rewind # resets iterator

# internal iteration, won't stop without break
# num maps to yielder, idx starts at zero and keeps going
enum.each_with_index do |num, idx| 
  p num
  break if idx == 6
end
 # each with index seems to autorewind at beginning
3.times {p enum.next} # each_with_index doesn't rewind at end