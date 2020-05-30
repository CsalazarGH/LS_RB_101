=begin
Write a method that returns the number of Friday the 13ths in the year given by an argument. 
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern 
Gregorian Calendar) and that it will remain in use for the foreseeable future.
=end

require 'date'

def friday_13th(year)
  count = 0

  12.times do |num|
    count += 1 if Date.new(year,num+1,13).friday?
  end
  count
end

p friday_13th(2019) 