def double_consonants(string)
  result = ''
  string.chars.each do |char|
    if is_consonant?(char)
      result << char * 2
    else
      result << char
    end
  end
  result
end

def is_consonant?(char)
  # char.match(/[a-zA-Z]/) && char.match(/[^aeiou]/)
  char.match(/[a-zA-Z&&[^aeiou]]/)
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""