# Array Average

def average(array)
  array.sum.to_f / array.count.to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25 # true
puts average([9, 47, 23, 95, 16, 52]) == 40 #true
