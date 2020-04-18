# 3. List of Digits

=begin
Write a method that takes one argument, a positive integer, 
and returns a list of the digits in the number.
=end

def digit_list1(digit)
  array = digit.to_s.split('').map do |strnum|
          strnum.to_i
          end
        end
# or 

def digit_list2(digit)
  digit.to_s.split('').map(&:to_i)
end

puts digit_list1(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list1(7) == [7]                     # => true
puts digit_list1(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list1(444) == [4, 4, 4]  # => true