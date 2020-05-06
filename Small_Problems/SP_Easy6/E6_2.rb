def remove_vowels(array) 
arr = array.map do |string|
        string.chars
      end

arr2 = arr.map do |set|
        set.delete_if do |char|
          ['a','e','i','o','u'].include?(char.downcase)
        end
      end.map do |set|
        set.join
      end


end


p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) 
p remove_vowels(%w(green YELLOW black white)) 
p remove_vowels(%w(ABC AEIOU XYZ)) 