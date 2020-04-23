def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") #[10, 5, 49, 150]
  return false unless dot_separated_words == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)   
  end
  true
end

dot_separated_ip_address?(10.5.49.150)
