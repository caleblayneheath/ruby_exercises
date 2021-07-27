=begin
goal: remove vowels from array of strings

input: an array of strings
output: new array of strings with vowels removed

use map to iterate over strings in array
  for the string, remove vowels to transform
    use gsub
return transformed array

=end

def remove_vowels(arry)
  arry.map do |string|
    string.gsub(/[aeiouAEIOU]/, '')
  end
end

p %w(ct dg xylphn) == remove_vowels(%w(cat dog xylophone))
p remove_vowels(%w(CAT DOG XYLOPHONE))