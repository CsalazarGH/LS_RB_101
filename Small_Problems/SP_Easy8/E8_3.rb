def substrings_at_start(string)
  string_size = string.length
  count = 0
  array = []

  loop do
    array << string[0..count]
    count += 1
    break if count == string_size
  end

  array
end




p substrings_at_start('abc') 