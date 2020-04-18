# 5. Reverse it (Part1)

=begin
Write a method that takes one argument, a string, 
and returns a new string with the words in reverse order.
=end

# hard code

def reverse_sentence(string)
  array = []
  array1 = string.split(" ")
  
  while array1.size > 0
    array << array1.pop
  end
  
  array.join(" ")
end

# quick code

def reverse_sentence2(string)
  string.split.reverse.join(" ")
end