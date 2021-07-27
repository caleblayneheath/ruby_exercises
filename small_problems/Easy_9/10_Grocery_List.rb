# def buy_fruit(list)
#   result = []
#   list.each do |fruit, quantity|
#     quantity.times { result << fruit }
#   end
#   result
# end

def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end


p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]