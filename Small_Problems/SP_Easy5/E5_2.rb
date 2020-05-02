HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60
MINS_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(int)
delta_minutes = int % MINS_PER_DAY
hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)

[hours, minutes].map do |integer|
   integer < 10 ? "0#{integer}" : "#{integer}"
end.join(':')

end



p time_of_day(0) 
p time_of_day(-3) 
p time_of_day(35) 