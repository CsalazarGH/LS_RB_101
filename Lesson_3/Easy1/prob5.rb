# Question 5: Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

range_of_numbers = (10..100)

p range_of_numbers.include?(42)
# => true

# you can also use range#cover?
p range_of_numbers.cover?(42)
# => true
