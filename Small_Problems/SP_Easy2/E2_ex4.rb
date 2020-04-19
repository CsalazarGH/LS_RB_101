# When will I Retire?

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retire_age = gets.chomp.to_i

years_to_go = retire_age - age
current_year = Time.now.year
retire_year = current_year + years_to_go

puts "Its currently #{current_year}. You will retire in #{retire_year}."
puts "You have #{years_to_go} years to go!"