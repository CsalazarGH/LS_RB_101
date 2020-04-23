# What is the result of the last line? (Line 9)


greetings = { a: 'hi' }
informal_greeting = greetings[:a] # Points to 'hi'
informal_greeting << ' there' # Points to 'hi' and mutates to 'hi there'

puts informal_greeting  #  => "hi there"
puts greetings # => should print {:a => "hi there"}

