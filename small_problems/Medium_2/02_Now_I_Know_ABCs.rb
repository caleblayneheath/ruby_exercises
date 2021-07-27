# def block_word?(word)
#   blocks = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)
#   letters = word.upcase.chars

#   letters.each do |letter|
#     index = blocks.find_index { |block| block.include?(letter) }
#     return false if index.nil?    
#     blocks.delete_at(index)
#   end
#   true
# end

# Launch School
def block_word?(word)
  blocks = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU)
  blocks.none? { |block| word.upcase.count(block) > 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true