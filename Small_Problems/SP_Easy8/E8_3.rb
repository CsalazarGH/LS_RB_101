def substrings_at_start(string)
  array = Array.new
  
  string.length.times do |num|
    array << string[0..num]
  end
  array
end



p substrings_at_start('abc') 