class Clock
  include Comparable
  attr_reader :time

  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60

  def initialize(minutes)
    @time = parse_minutes(minutes)
  end

  def parse_minutes(minutes)
    minutes % (HOURS_IN_DAY * MINUTES_IN_HOUR)
  end

  # this should return a new clock instance
  def self.at(hour, minutes = 0)
    new((hour * MINUTES_IN_HOUR) + minutes)
  end

  # turns integer of minutes to HH:MM 24 string
  def to_s
    hour, minute = time.divmod(60)
    hour = 0 if hour == 24
    format('%02d:%02d', hour, minute)
  end

  def +(minutes)
    @time = parse_minutes(time + minutes)
    self
  end

  def -(minutes)
    @time = parse_minutes(time - minutes)
    self
  end

  def <=>(other)
    time <=> other.time
  end
end
