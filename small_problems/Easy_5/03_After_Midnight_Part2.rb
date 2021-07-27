HOURS_IN_DAY = 24
MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = HOURS_IN_DAY * MINUTES_IN_HOUR

def after_midnight(time)
  hour, min = time.split(':').map(&:to_i)
  (hour * MINUTES_IN_HOUR + min) % MINUTES_IN_DAY
end

def before_midnight(time)
  hour, min = time.split(':').map(&:to_i)
  (MINUTES_IN_DAY - (hour * MINUTES_IN_HOUR + min)) % MINUTES_IN_DAY
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0