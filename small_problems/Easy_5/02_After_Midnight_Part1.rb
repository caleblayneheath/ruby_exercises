MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

DAY_OF_WEEK = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)

# def time_of_day(time)
#   hour_min = (time % 1440).divmod(60)
  
#   "#{format_time(hour_min.first)}:#{format_time(hour_min.last)}"
# end

# def format_time(time)
#   format('%02d', time)
# end

# def time_of_day(time)
#   hour_min = (time % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hour_min.first, hour_min.last)  
# end

def time_of_day(time)
  day = ((time / MINUTES_PER_DAY) + 7) % 7
  hour_min = (time % MINUTES_PER_DAY).divmod(MINUTES_PER_HOUR)
  format('%s %02d:%02d', DAY_OF_WEEK[day], hour_min.first, hour_min.last)  
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

p time_of_day(0) 
p time_of_day(-3) 
p time_of_day(35) 
p time_of_day(-1437) 
p time_of_day(3000) 
p time_of_day(800) 
p time_of_day(-4231) 