def letter_percentages(string)
  result = {}
  size = string.chars.size
  lowcase_count = string.count('a-z')
  result[:lowercase] = to_percentage(lowcase_count, size)
  upcase_count = string.count('A-Z')
  result[:uppercase] = to_percentage(upcase_count, size)
  result[:neither] = to_percentage(size - upcase_count - lowcase_count, size)
  result
end

def to_percentage(numerator, denominator)
  ((numerator.to_f / denominator.to_f) * 100).round(2)
end


p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')