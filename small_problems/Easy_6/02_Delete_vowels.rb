VOWELS = %w(a e i o u)

def remove_vowels(arry)
  arry.map do |string|
    string.chars.reject { |char| VOWELS.include?(char.downcase) }.join
  end  
end

# Launch School way
# def remove_vowels(arry)
#   arry.map { |string| string.delete('AEIOUaeiou')}
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']