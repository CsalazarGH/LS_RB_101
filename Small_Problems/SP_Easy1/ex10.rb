# What's my Bonus?

def calculate_bonus(digit, boolean_value)
  boolean_value ? (digit / 2) : 0
end


puts calculate_bonus(2800, true) == 1400 # => True
puts calculate_bonus(1000, false) == 0 # => True
puts calculate_bonus(50000, true) == 25000 # => True