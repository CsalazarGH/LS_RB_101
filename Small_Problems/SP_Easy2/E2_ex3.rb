# 3. Tip Calculator

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
percent = gets.chomp.to_f / 100

tip = bill * percent
total = bill + tip

puts "The tip is $#{tip}."
puts "The total is $#{total}."