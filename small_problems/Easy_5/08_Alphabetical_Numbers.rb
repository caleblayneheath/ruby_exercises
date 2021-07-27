ALPHABETIC_NUMBERS = %w(8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
6, 16, 10, 13, 3, 12, 2, 0).join.split(',').map(&:to_i)

def alphabetic_number_sort(arry)
  arry.sort { |num1, num2| ALPHABETIC_NUMBERS.index(num1) <=> ALPHABETIC_NUMBERS.index(num2) }
end

# NUMBER_WORDS = %w(zero one two three four
#                   five six seven eight nine
#                   ten eleven twelve thirteen fourteen
#                   fifteen sixteen seventeen eighteen nineteen)

# def alphabetic_number_sort(arry)
#   arry.sort_by { |num| NUMBER_WORDS[num] }
# end

p alphabetic_number_sort(0..19)
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]