# 7. Stringy Strings

=begin
Write a method that takes one argument, a positive integer, and returns a string 
of alternating 1s and 0s, always starting with 1. The length of the string should match 
the given integer.
=end

def stringy(digit)
string = ''
  loop do
    string << '1'
    break if string.length == digit
    string << '0'
    break if string.length == digit
  end
  string
end

