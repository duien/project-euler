# You are given the following information, but you may prefer to do some
# research for yourself.
# 
# - 1 Jan 1900 was a Monday.
# - Thirty days has September,
#   April, June and November.
#   All the rest have thirty-one,
#   Saving February alone,
#   Which has twenty-eight, rain or shine.
#   And on leap years, twenty-nine.
# - A leap year occurs on any year evenly divisible by 4, but not on a century
#   unless it is divisible by 400.
# 
# How many Sundays fell on the first of the month during the twentieth century
# (1 Jan 1901 to 31 Dec 2000)?
 
def leap_year?( year )
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end

def days_in( month, year )
  case month
  when 'feb'
    leap_year?(year) ? 29 : 28
  when 'jan', 'mar', 'may', 'jul', 'aug', 'oct', 'dec'
    31
  else
    30
  end
end

def dotw_for( year, month, day )
  # first, how many days has it been since Jan 1, 1900
  days_since = 0
  if year > 1900
    (year-1).downto(1900) do |y|
      days_since += leap_year?(y) ? 366 : 365
    end
  end
  (month-1).downto(1) do |m|
    days_since += days_in( MONTHS[m-1], year )
  end
  days_since += day-1
  DAYS_OF_THE_WEEK[ days_since % 7 ]
end
  

first_sundays = 0
DAYS_OF_THE_WEEK = %w{ monday tuesday wednesday thursday friday saturday sunday }
MONTHS = %w{ jan feb mar apr may jun jul aug sep oct nov dec }

(1901..2000).to_a.each do |year|
  (1..12).to_a.each do |month|
    first_sundays += 1 if dotw_for( year, month, 1 ) == 'sunday'
  end
end
puts first_sundays
