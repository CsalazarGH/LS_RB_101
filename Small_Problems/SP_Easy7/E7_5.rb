def staggered_case(string)
  chars = string.chars
  chars.each_with_index do |char, index|
    index.odd? ? char.upcase! : char.downcase!
  end.join
end


p staggered_case2('ignore 77 the 444 numbers') 