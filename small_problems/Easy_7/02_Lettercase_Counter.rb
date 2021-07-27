def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    if char.match?(/[a-z]/)
      result[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end
  result

  # Advanced Launch School 
  # counts = {}
  # characters = string.chars
  # counts[:lowercase] = characters.count { |char| char =~ /[a-z]/}
  # counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/}
  # counts[:neither] = characters.count { |char| char =~ /[^a-zA-Z]/}
  # counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }