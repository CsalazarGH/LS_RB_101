=begin
What do you expect to happen when the greeting 
variable is referenced in the last line of the code below?
=end

=begin
I expect this program to return nil because the expression
will automatically evaluate to "true". There is nothing to return
if true or a rescue.
=end


if false
  greeting = “hello world”
end

p greeting