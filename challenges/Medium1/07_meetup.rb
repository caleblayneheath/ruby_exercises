=begin
initialize creates date object with year and month

day method returns Date object matching parameters
day(symbol_for_day_of_week, symbol_for_day_of_month )

day_of_week
:monday, etc.

days of month
:first, :second, :third, :fourth =>
correspond to xth occurance of day that month
:last is last occurance of that month (how to determine?)
:teenth is 13 through 19, one of these will each fall on diff weekday

we can check any given day to see if mon, tue, etc.
We can increment a date object
naive approach, create a date object for every day of the month
and return first date object that fits criteria

weekdays can be check for with existing functions
determing first, second, third, fourth, last
and teenth occurance of month nontrivial

create date object for first day of month
check to see if day of week matches parameter
  if yes, move to checking for day_of_month
  else increment day

ith of weekday is now equal to 1
check to see if day of month matches criteria (same month, day)
if yes, return date object
else increment 7 days
=end

# my solution
# class Meetup
#   ORDER = %i[first second third fourth].freeze

#   def initialize(month, year)
#     @month = month
#     @year = year
#   end

#   def day(weekday, schedule)
#     possible_dates = get_all_xdays(weekday)
#     select_from_possible_dates(possible_dates, schedule)
#   end

#   private

#   def get_first_xday(weekday)
#     test_day = (weekday.to_s + '?')
#     dates = Date.new(@year, @month)..Date.new(@year, @month, 7)
#     dates.find { |date| date.public_send(test_day) }
#   end

#   def get_all_xdays(weekday)
#     meeting_day = get_first_xday(weekday)

#     possible_dates = []
#     loop do
#       possible_dates << meeting_day
#       meeting_day += 7
#       break if meeting_day.month != @month
#     end
#     possible_dates
#   end

#   def select_from_possible_dates(possible_dates, schedule)
#     case schedule
#     when :last then possible_dates[-1]
#     when :teenth then determine_teenth(possible_dates)
#     else possible_dates[ORDER.index(schedule)]
#     end
#   end

#   def determine_teenth(possible_dates)
#     possible_dates.find { |choice| (13..19).cover?(choice.day) }
#   end
# end

# blind reattempt having read solutions
class Meetup
  START_DATE = { first: 1, second: 8, third: 15, fourth: 22,
  teenth: 13, last: -7 }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day_of_week, schedule)
    meeting_date = Date.new(@year, @month, START_DATE[schedule])

    loop do
      break if meeting_date.public_send("#{day_of_week}?")
      
      meeting_date += 1
    end
    meeting_date
  end
end