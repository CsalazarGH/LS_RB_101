MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def time_of_day(minutes)

minutes = minutes % MINUTES_PER_DAY
hours, minutes = minutes.divmod(MINUTES_PER_HOUR)
"#{hours}:#{minutes}"
end





p time_of_day(-4231)