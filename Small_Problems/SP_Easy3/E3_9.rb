# Palindromic Strings (Part 2)

def real_palindrome?(string)
  string.downcase!
  letters = 'a'.upto('z').to_a

  array = string.chars.delete_if do |char|
          letters.include?(char) == false
  end

  array.reverse == array ? true : false
  
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false