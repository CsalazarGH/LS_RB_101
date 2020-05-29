def substrings_at_start(string)
  array = Array.new
  string.length.times {|num| array << string[0..num] }
  array
end

def substrings(string)
  substrings = Array.new

  string.size.times do |num|
    substrings << substrings_at_start(string[num..-1])
  end
  substrings.flatten!
end

def palindrome?(str)
  (str.size > 1) && (str.reverse == str)
end

def palindromes(string)
  substrings(string).keep_if {|str| palindrome?(str)}
end

p palindromes('abcd')
p palindromes('madam')
p palindromes('hello-madam-did-madam-goodbye')
p palindromes('knitting cassettes')