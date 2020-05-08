def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

# The bug was on line 9 which was originally 'decrease(counter)'. 
# This line would return '9' but not actually mutate the counter variable on line 5.
# This would cause line 8 to print '10' to the screen 10 times & then break the loop.
# To fix this error, I set counter = decrease(counter) on line 9 so each iteration will reduce
# the counter variable integer by 1.