def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |outer_value|
    arr2.each do |inner_value|
      products << outer_value * inner_value
    end
  end
  products.sort
end

# Launch School solution
# def multiply_all_pairs(arr1, arr2)
#   arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
# end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
