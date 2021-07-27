=begin
input: string of letters making words(at most 20 letters) 
      which are seperated by one or more spaces, with the last
      word having zero or more spaced followed by a period
output: new string where words are separated by a single space and the last word has a period right after
odd words(every second word) have their letters reversed, while even remain the same

create empty result array
create empty word string
iterate through every char of input string
  if char is a letter  
    append current char to word string
  elsif char is a space
    append word string to result array unless word_string empty
    set word_string to empty string
  end

use map with index on result array
  reverse word if index is odd
return joined transformed array with '.' appended

=end

class String
  def odd_words
    return '' unless self =~ /\w\s*\./
    self.scan(/\w+/).map.with_index do |word, index|
      index.odd? ? word.reverse : word
    end.join(' ') << '.'
  end
end

# class String
#   def odd_words
#     return '' if self.gsub(/[.\s]/, '').empty?
#     result = []
#     word = ''
#     self.each_char do |char|
#       if char =~ /[a-zA-Z]/
#         word << char
#       elsif char =~ /[\s.]/
#         result << word unless word.empty?
#         word = ''
#       end
#     end
#     result.map!.with_index do |elem, idx|
#       idx.odd? ? elem.reverse : elem
#     end.join(' ') << '.'
#   end
# end