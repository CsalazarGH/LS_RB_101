# Squaring an Argument

def multiply(x, y)
  x * y
end

def square(digit)
  multiply(digit, digit)      # same as digit * digit
end

# or square to nth argument

def square2(digit, x)
  digit ** 3
end

