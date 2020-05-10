def word_to_digit(string)
  arr =  %w(zero one two three four five six seven eight nine)

  arr.each do |number| 
      string.index(number) == nil ? number : string.gsub!(number, (arr.index(number)).to_s)
  end
  
  p string
end

word_to_digit('Please call me at five five five one two three four. Thanks.') 

