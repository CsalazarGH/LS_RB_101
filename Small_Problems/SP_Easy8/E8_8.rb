VOWELS = ['a','e','i','o','u']

def double_consonants(string)
  chars = string.chars

  chars.map! do |char|
    if !('a'..'z').to_a.include?(char.downcase) 
      char
    elsif ['a','e','i','o','u'].include?(char.downcase) 
      char
    else
      char + char
    end
  end

  chars.join
end


