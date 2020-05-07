def uppercase?(string)
  letters = string.chars.keep_if do |char|
              ('a'..'z').to_a.include?(char.downcase)
            end

  letters.all? do |char|
    char == char.upcase 
  end
end

#most efficient way below

def uppercase2?(string)
  string == string.upcase
end