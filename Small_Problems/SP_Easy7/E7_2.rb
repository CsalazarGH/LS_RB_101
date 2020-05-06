def letter_case_count(string)
  l_alpha = ('a'..'z').to_a
  c_alpha = ('A'..'Z').to_a

  hash = {'lowercase' => 0, 'uppercase' => 0, 'neither' => 0 } 
        
  string.chars.each do |char|
    if l_alpha.include?(char)
      hash['lowercase'] += 1
    elsif c_alpha.include?(char)
      hash['uppercase'] += 1
    else
      hash['neither'] += 1
    end
  end

  hash
end


p letter_case_count('') 