def reverse_sentence(sentence)
  words = sentence.split(' ') #['how', 'are', 'you', 'doing']
  reversed_words = [] 

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')


# Line 7 was reversed_words = words[i] + reversed_words 

=begin
Line 7 returned a type error because we could not append the word to the array using '+'.
This is because words[i] points to a string, and you cannot append a string and array together using '+'.
We had to change the string to [words[i]] that way it can append that array to the reversed_words array.
=end