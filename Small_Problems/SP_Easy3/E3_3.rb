# Counting the Number of Characters
puts "Please enter a string"
string = gets.chomp

array = string.chars.delete_if {|char| char == ' '}

puts "There are #{array.size} characters in #{string}."
