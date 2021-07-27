def short_long_short (str1, str2)
  if str1.length < str2.length
    side, middle = str1, str2
  else
    side, middle = str2, str1
  end
  side + middle + side
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"