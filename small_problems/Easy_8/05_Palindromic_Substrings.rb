def substrings(string)
  result = []
  left = 0
  while left < string.length do
    right = left
    while right < string.length do
      result << string[left..right]
      right += 1
    end
    left += 1
  end
  result
end

def palindromes(string)
  substrings(string).select do |item|
    item.reverse == item && item.length > 1 && !item.match(/[^0-9a-zA-Z]/)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', 'madam', 'ada', 'did', 'madam', 'ada', 'oo'
]