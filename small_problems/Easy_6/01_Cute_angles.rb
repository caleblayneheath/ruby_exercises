DEGREE = "\xC2\xB0"
SECONDS_IN_MINUTE = 60
MINUTES_IN_DEGREE = 60
SECONDS_IN_DEGREE = SECONDS_IN_MINUTE * MINUTES_IN_DEGREE

def dms(angle)
  angle = angle % 360
  angle = (angle * SECONDS_IN_DEGREE).round
  degrees, minutes = angle.divmod(SECONDS_IN_DEGREE)
  minutes, seconds = minutes.divmod(SECONDS_IN_MINUTE)
  format("%d#{DEGREE}%02d'%02d\"", degrees, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")