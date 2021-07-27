=begin
input: a string, output: reversed string

start with a string and end with the string

create new object from input: array of chars
create a new results array
pop elements from array of chars into results array until char array is empty
return results array joined as string
=end

def my_reverse(str)
  return str if str.size <= 1

  input = str.chars
  results = ''
  while input.size > 0 do
    results << input.pop
  end
  results
  
end

p my_reverse('abcd') #== ('dcba')
p my_reverse('a') == ('a')
p my_reverse('') == ('')
