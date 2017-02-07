#You are given the following information, but you may prefer to do some research for yourself.
#
#    1 Jan 1900 was a Monday.
#    Thirty days has September,
#    April, June and November.
#    All the rest have thirty-one,
#    Saving February alone,
#    Which has twenty-eight, rain or shine.
#    And on leap years, twenty-nine.
#    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

year = 1901
month = 1
day = 1

# ok, 1900 mod 400 != 0, so 1900 was not a leap year, so 1/1/1901 was a Tuesday.

weekday = 2 #Sunday is 0, Monday is 1, etc. up to 6

# all the other years are normal years: if year mod 4 = 0, it has 366 days, otherwise 365.

count = 0

while year < 2001
	if day == 1 and weekday == 0
		count +=1
	end
	#advance one day
	day += 1
	weekday += 1
	weekday = 0 if weekday > 6
	if (day > 31) or ((day > 30) and (month == 9 or month == 6 or month == 4 or month == 11)) or ((day > 29) and((month == 2) and (year % 4 == 0))) or ((day > 28) and ((month == 2) and (year % 4 != 0)))
		day = 1
		month += 1
	end
	if month > 12
		month = 1
		year +=1
	end
end

puts count
puts "#{year}/#{month}/#{day}"