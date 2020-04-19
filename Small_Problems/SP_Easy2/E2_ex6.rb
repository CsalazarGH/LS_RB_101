# Odd Numbers

range = (1..99)

range.each do |number|
  puts number if number.odd?
end

#or

count = 1

while count < 100
  puts count if count.odd?
  count += 1
end

