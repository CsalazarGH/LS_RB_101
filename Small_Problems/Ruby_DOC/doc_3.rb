def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# 4 is assigned to a, 5 is assigned to be and then only c and d are left, but one argument is available
# 6 is assigned to the variable that does not have a default paremeter set (d)