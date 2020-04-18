# Sum of Digits
# Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(digit)
  array = digit.to_s.split('').map(&:to_i)
  array.sum
end
