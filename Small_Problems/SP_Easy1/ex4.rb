# 4. How many?

=begin
Write a method that counts the number of occurrences of each element 
in a given array. The words in the array are 
case-sensitive: 'suv' != 'SUV'. 
Once counted, print each element alongside the number of occurrences.
=end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'suv', 'SuV', 'truck', 
'motorcycle', 'motorcycle', 'car', 'truck']

# case sensitive model
def count_occurences(array)
  unique_words_symbols = array.uniq
  counts = {}
    unique_words_symbols.each do |type|
      counts[type] = array.count(type)
    end
  counts
end

# case insensitive model

def count_occurences2(array)
    counts = {}
    downcase_array = array.map(&:downcase)
    uniq_words = (array.uniq.map {|word| word.downcase}).uniq
      uniq_words.each do |word|
        counts[word] = downcase_array.count(word)
      end
  counts
end



