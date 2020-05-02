def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin
The above method returns a different object because we call the #split method 
on the varible (str) and then the each method on the array str.split returns.
The #each method will return the object it was called on, in this case: str.split (an array).
=end