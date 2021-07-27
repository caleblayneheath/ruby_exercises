=begin
goal: take a string, return boolean showing whether string has balanced set of parenthesis
input: string with parenthesis
output: true/false

take string
get count of lparens, count of rparents, see if equal to each other


conditions: numb of left and right parens must be equal
            left parens to come before right parens
            ()()

=end

def balancer(string)
  # paren_count_same?(string)
  count = 0
  string.chars.each do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if count < 0
  end
  count == 0
end

def paren_count_same?(string)
  string.count('(') == string.count(')')
end

def first_paren_left_paren?(string)
  string.chars.index('(') < string.chars.index(')')
end

p balancer('(hi)')
p balancer('(hi))')
p balancer('((hi)')
p balancer('((hi))')
p balancer(')hi(')
p balancer('((hi)))(')