DEGREE = "\xC2\xB0"

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = 3600


def dms(int)
  seconds = ((int % 360) * SECONDS_PER_DEGREE).round
  degrees, seconds = seconds.divmod(SECONDS_PER_DEGREE)
  minutes, secs = seconds.divmod(SECONDS_PER_MINUTE)

  [degrees, minutes, secs]
end


p dms(76.64) 