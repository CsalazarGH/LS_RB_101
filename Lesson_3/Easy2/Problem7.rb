# In the previous practice problem we added Dino to our array like this:

#flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#flintstones << 'Dino'

# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy') # We could also use flintstones.push("Dino").push("Hoppy")   

p flintstones
