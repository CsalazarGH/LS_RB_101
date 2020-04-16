# What would you expect this code to output?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# My answer before checking = [1, 2, 2, 3]

=begin
This is because numbers.uniq (line 4) creates a new array
containing the unique values of the numbers array (line3).
This new array does not mutate the original array (Line3).
You could use array.uniq! to mutate the original array.
=end
