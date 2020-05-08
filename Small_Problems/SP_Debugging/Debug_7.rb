def neutralize(sentence)
  words = sentence.split(' ')
  words.keep_if {|word| negative?(word) == false}
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

=begin line 3 - 5 was
words.each do |word|
    words.delete(word) if negative?(word)
  end

This was causing the words to shift over to the left everytime a word was deleted, and causing certain words to 
get skipped over.

I changed those lines to words.keep_if {|word| negative?(word) == false} to cleanly remove any words that
evaluated to true in the negative? method.
=end