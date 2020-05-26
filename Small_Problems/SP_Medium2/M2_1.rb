file = File.open("pg84.txt")
text = file.read.split(/[.!?]/)

text.map! do |sent|
  sent.split
end.map! do |set|
  set.size
end

p text.max