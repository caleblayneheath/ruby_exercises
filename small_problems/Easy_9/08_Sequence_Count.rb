# def sequence(count, first_num)
#   results = []
#   count.times do |i|
#     results << (i + 1) * first_num
#   end
#   results
# end

# Launch School
def sequence(count, first_num)
  (1..count).map{ |value| value * first_num }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []