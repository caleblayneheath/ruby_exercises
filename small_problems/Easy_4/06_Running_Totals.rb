def running_total(arry)
  # total = 0
  # result = []
  # while arry.size > 0 do
  #   total += arry.shift
  #   result << total
  # end
  # result

  # total = 0
  # arry.map { |i| total += i}

  total = 0
  arry.each_with_object([]){ |i, a| a << (total += i)}
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []