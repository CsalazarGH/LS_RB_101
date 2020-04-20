# Palindromic Strings (Part 1)

def palindrome?(string)
  if string.reverse == string
    true
  else
    false
  end
end







puts palindrome?('madam') == true
puts palindrome?('Madam') == false     # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true