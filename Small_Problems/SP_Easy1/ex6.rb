# 6. Reverse It (Part2)

def reverse_words(string)
array = string.split.map do |word|
          word.length >= 5 ? word.reverse : word
        end
array.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')        