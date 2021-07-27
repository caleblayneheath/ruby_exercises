def penultimate(string)
  string.split.fetch(-2, '')
end

def middle(string)
  work_str = string.split
  midpoint = work_str.size / 2
  work_str.fetch(midpoint, '')
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('great') == ''
p penultimate('') == ''
puts
p middle('last word') == 'word'
p middle('Launch School is great!') == 'is'
p middle('great') == 'great'
p middle('') == ''