# Short Long Short

def short_long_short(string1, string2)
  case string1.length <=> string2.length
  when -1 then string1 + string2 + string1
  when 1 then string2 + string1 + string2
  else "both strings are same legnth"
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc" # => true
p short_long_short('abcde', 'fgh') == "fghabcdefgh" # => true
p short_long_short('', 'xyz') == "xyz" # => true