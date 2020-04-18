# 2. Odd

=begin
Write a method that takes one integer argument, which may be positive, 
negative, or zero. This method returns true if the number's 
absolute value is odd. You may assume that the argument is a 
valid integer value.
=end

# Keep in mind that you're not allowed to use #odd? or #even? 

def is_odd?(digit)
  digit % 2 != 0
end

