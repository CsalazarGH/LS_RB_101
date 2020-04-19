# Greeting a user

puts "What is your name?"
name = gets.chomp

screaming = "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
normal = "Hello #{name}."

name[-1] == "!" ? puts(screaming) : puts(normal)




