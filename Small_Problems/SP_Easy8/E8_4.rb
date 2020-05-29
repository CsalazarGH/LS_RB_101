def substrings_at_start(string)
  array = Array.new

  string.length.times do |num|
    array << string[0..num]
  end
  array
end

def substrings(string)
  substrings = Array.new

  string.size.times do |num|
    substrings << substrings_at_start(string[num..-1])
  end
  substrings.flatten!
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]