def century(year)
  century_number = ((year - 1) / 100) + 1
  suffix = ''
  if 11 == century_number % 100 || 12 == century_number % 100 || 13 == century_number % 100
    suffix = 'th'
  elsif century_number % 10 == 1
    suffix = 'st'
  elsif century_number % 10 == 2
    suffix = 'nd'
  elsif century_number % 10 == 3
    suffix = 'rd'
  else
    suffix = 'th'
  end
  century_number.to_s + suffix 

end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'