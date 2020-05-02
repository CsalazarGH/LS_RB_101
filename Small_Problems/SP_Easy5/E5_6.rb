=begin
First step: Create an array of the words split up
Second Step: Create an array of unique string lengths to count for.
Third step: Iterate through the unique lengths, and count how many elements have that length.

Final result: A hash that will will contain string lengths as keys, 
and # of elements with that string length as values.
=end

def word_sizes(string)
  counts = Hash.new(0)
  words = string.split #['Four', 'score', 'and', 'seven.']

  words.each {|word| counts[word.length] += 1 }
 counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}