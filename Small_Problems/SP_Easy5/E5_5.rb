def cleanup(string)
  letters = ("a".."z").to_a

  chars = string.chars.map do |char|
            if letters.include?(char)
              char
            else
              ' '
            end
          end
  chars.join.squeeze
end
