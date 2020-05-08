def shout_out_to(name)
  name.upcase!

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

# We removed 'name.chars.each { |c| c.upcase! }' from line 2 and replaced it with name.upcase!
# name.chars.each { |c| c.upcase! } returns a new array which is a different object from name.
# Because they are not the same object, the original value of 'name' is printed when referenced on line 7