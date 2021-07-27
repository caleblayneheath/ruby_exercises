# def swap(string)
#   string = string.split
#   string.map! do |word| 
#     if word.length <= 1
#       word
#     else
#       front = word.slice!(0)
#       back = word.slice!(-1)
#       word = back + word + front
#     end
#   end
#   string.join(' ')
# end

def swap(string)
  string = string.split
  string.map! do |word| 
    word[0], word[-1] = word[-1], word[0]
    word
  end
  string.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'