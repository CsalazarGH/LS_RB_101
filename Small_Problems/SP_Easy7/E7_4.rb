def swapcase(string)
  lowercase = ('a'..'z').to_a

  string.chars.map do |char|
    case char
    when ' ' then ' '
    else lowercase.include?(char) ? char.upcase : char.downcase
    end
  end.join

end

p swapcase('CamelCase') 
p swapcase('Tonight on XYZ-TV')