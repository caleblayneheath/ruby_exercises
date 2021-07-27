require 'pry-byebug'

# def balanced?(string)
#   parentheses = string.chars.select{ |char| char == '(' || char == ')'}
#   result = []
#   parentheses.each do |mark|
#     result << mark
#     2.times { result.pop } if mark == ')' && result[-2..-1] == ['(', ')']
#   end
#   result.empty? ? true : false
# end

def balanced?(string)
  balanced_parens_and_bracks?(string) && balanced_quotes?(string)
end

# doesn't account for apostrophes
def balanced_quotes?(string)
  (string.count("'") % 2 == 0) && (string.count('"') % 2 == 0)
end

# Launchschool
def balanced_parens_and_bracks?(string)
  marks = ['[]'.chars, '{}'.chars, '()'.chars]
  marks.each do |mark|
    count = 0
    string.chars.each do |char|
      count += 1 if char == mark.first
      count -= 1 if char == mark.last
      break if count < 0
    end
    return false unless count.zero?
  end
  true
end

p balanced?('What (is) this?') == true
p balanced?('What is" this?') == false
p balanced?('What [is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('{{What}} {is this}}?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?("wass'up") == false