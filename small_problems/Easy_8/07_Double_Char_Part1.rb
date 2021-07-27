def repeater(string, repetitions = 2)
  result = ''
  string.chars.each do |char|
    result << char * repetitions 
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
p repeater('ab', 3) == 'aaabbb'