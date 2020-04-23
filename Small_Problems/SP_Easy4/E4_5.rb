def multisum(digit)
array = []
while digit > 0
  array << digit if (digit % 3 == 0) || (digit % 5 == 0)
  digit -= 1
end
array.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# all evaluate to true