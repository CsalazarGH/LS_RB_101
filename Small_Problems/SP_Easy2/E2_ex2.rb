# 2. How big is the room?

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area = length * width
area_in_sqfeet = area * 10.7639


puts "The area of the room is #{area} sqaure meters (#{area_in_sqfeet.round(2)} Square feet)."