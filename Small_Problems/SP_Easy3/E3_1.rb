# Searching 101

array = []

puts "Enter the 1st number:"
  array << number1 = gets.chomp.to_i

puts "Enter the 2nd number:"
  array << number2 = gets.chomp.to_i

puts "Enter the 3rd number:"
  array << number3 = gets.chomp.to_i

puts "Enter the 4th number:"
  array << number4 = gets.chomp.to_i

puts "Enter the 5th number:"
  array << number5 = gets.chomp.to_i

puts "Enter the 6th number:"
  digit = gets.chomp.to_i

if array.include?(digit)
  puts "The number #{digit} is in #{array}."
else
  puts "The number #{digit} is not in #{array}."
end

