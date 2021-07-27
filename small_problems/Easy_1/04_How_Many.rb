def count_occurrences(list)
  output = Hash.new(0)
  list.each { |item| output[item.downcase] += 1 }
  output.each { |key, value| puts "#{key} => #{value}"}
end

vehicles = [
  'cAr', 'Car', 'truck', 'caR', 'suv', 'truck',
  'motorCycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
