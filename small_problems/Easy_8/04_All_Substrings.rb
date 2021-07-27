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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]