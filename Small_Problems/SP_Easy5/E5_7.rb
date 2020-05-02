=begin
Step1.) Split all the words in the string up into individual elements
Step2.) Remove any non-alphabet char's from the strings (regex or another way)
Step3.) Create an array of unique lengths of the elements
Step4.) Iterate through each length and count how many elements have that length.
=end

LETTERS = ('a'..'z').to_a 

def cleaned_words(words)
  new_array = words.map do |word|
                word.chars.delete_if do |char|
                  LETTERS.include?(char.downcase) == false
                end
              end
  new_array
end


def word_sizes(string)
  hash = Hash.new(0)
  words = string.split() #['Four', 'score', 'and', 'seven.']

  clean_words = cleaned_words(words).map do |chars|
                chars.join
                end
  
  clean_words.each do |word|
    hash[word.size] += 1
  end

 hash
end






p word_sizes('Four score and seven.') 