def ascii_value(string)
  # string.chars.map { |char| char = char.ord }.sum
  string.chars.map(&:ord).sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0