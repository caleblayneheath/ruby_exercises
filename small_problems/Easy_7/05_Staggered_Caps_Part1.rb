def staggered_case(string, first = 'up')
  result = []
  string.chars.each_with_index do |char, idx|
    idx.even? ? result << char.upcase : result << char.downcase
  end
  result = result.join

  if first == 'up'
    result
  elsif first == 'down'
    result.swapcase
  else
    puts 'ERROR'
  end
end

p staggered_case('I Love Launch School!', false) #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'