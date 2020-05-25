def sum_square_difference(int)
nums = Array.new

while int > 0 
  nums << int
  int -= 1
end

set1 = ((nums.sum) ** 2) 
set2 = (nums.map {|num| num ** 2}).sum

set1 - set2
end



p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150