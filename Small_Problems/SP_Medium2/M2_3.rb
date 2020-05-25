def letter_percentages(string)
  hash = {lowercase: 0, uppercase: 0, neither: 0}

  string.chars.each do |char|
    if !(('a'..'z').to_a.include?(char.downcase))
      hash[:neither] += 1
    elsif char == char.upcase
      hash[:uppercase] += 1
    else
      hash[:lowercase] += 1
    end
  end

   hash.to_a.map do |set|
      [set[0], (set[1].to_f / string.length) * 100]
   end.to_h
end



p letter_percentages('abCdef 123') == {:lowercase=>50.0, :uppercase=>10.0, :neither=>40.0}
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }