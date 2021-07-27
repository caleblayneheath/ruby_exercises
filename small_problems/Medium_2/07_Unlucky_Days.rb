require 'date'

# def friday_13th(year)
#   counter = 0
#   date = Date.new(year)
#   num_of_days = date.leap? ? 366 : 365

#   num_of_days.times do |day|
#     counter += 1 if date.friday? && date.day == 13
#     date = date.next_day
#   end
#   counter
# end

def friday_13th(year)
  counter = 0
  date = Date.new(year, 1, 13)
  12.times do 
    counter += 1 if date.friday?
    date = date.next_month
  end
  counter
end

def five_fridays(year)
  month_count = Hash.new(0)
  date = Date.new(year)
  num_of_days = date.leap? ? 366 : 365

  num_of_days.times do |day|
    month_count[date.month] += 1 if date.friday?
    date = date.next_day
  end

  month_count.values.select { |fridays| fridays >= 5 }.size
end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2

p five_fridays(2015) == 4
p five_fridays(1986) == 4
p five_fridays(2019) == 4