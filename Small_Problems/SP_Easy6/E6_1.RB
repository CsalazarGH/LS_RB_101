SECONDS_PER_MINUTE = 60
MINUTES_PER_DEGREE = 60
SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * MINUTES_PER_DEGREE


def dms(int)

total_seconds = (int % 360) * SECONDS_PER_DEGREE #1296000
minutes, seconds = total_seconds.divmod(60)
degrees, minutes = minutes.divmod(60)

seconds < 10 ? seconds = "0#{seconds.to_i}" : seconds = "#{seconds.to_i}"
minutes < 10 ? minutes = "0#{minutes.to_i}" : minutes = "#{minutes.to_i}"
 

final_string = [degrees.to_s + "\xC2\xB0" ,minutes + "'",seconds + '"'].join
end



