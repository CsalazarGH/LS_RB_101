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

def substrings(string)
  count = 0
  array = []

 (string.length).times do 
    array << string[count..-1]
    count += 1
 end

  array.map do |string| 
    substrings_at_start(string)
  end.flatten

end




p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]