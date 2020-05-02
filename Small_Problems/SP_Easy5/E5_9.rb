# My first solution

def crunch(string)
  words = string.split.map! do |word| 
    word.chars.each_with_index.map do |char, index|
      char == word.chars[index+1] ? '' : char
    end
  end
words.map! {|set| set.join}.join(' ')
end


# My second solution after re-thinking and refactoring

def crunch2(string)
  string.chars.each_with_index.map do |char, index|
    char == string.chars[index + 1]? char = '' : char
  end.join
 end

 
 #Both solutions will return true for all the tests