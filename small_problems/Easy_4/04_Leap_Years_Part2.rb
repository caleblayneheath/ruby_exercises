def leap_year?(year)
  # year >= 1752 ? gregorian_p leap_year?(year) : julian_p leap_year?(year)
  if year >= 1752
    gregorian_leap_year?(year)
  else
    julian_leap_year?(year)
  end
end

def julian_leap_year?(year)
  year % 4 == 0
end

def gregorian_leap_year?(year)
  if year % 400 == 0
    true
  elsif (year % 4 == 0) && !(year % 100 == 0)
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true