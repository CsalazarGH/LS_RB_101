def staggered_case(string)

  orig = string.chars

  chars = string.chars.keep_if do |char|
            ('a'..'z').to_a.include?(char.downcase)
          end

  chars.each_with_index do |char, index| # ["I", "l", "O", "v", "E", "l", "A", "u", "N", "c", "H", "s", "C", "h", "O", "o", "L"]
    index.even? ? char.upcase! : char.downcase!
  end

  orig.each_with_index do |char, index|
    if chars[index] == nil
      chars.insert(index, char)
    else
      chars[index].downcase == char.downcase ? (chars[index]) : (chars.insert(index,char))
    end
  end

  chars.join
end 



p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'