# Sum or Product of Consecutive Integers

def sum(digit)
  array = []
  number = digit
    while number > 0 
      array << number
      number -= 1
    end
    array.sum
end

  def product(digit)
    array = []
    number = digit
      while number > 0 
        array << number
        number -= 1
      end
      array.inject(&:*)
  end
  

puts "Please enter an integer greater than 0:"
integer = gets.chomp.to_i

puts "Enter 's' to compute the sum, or 'p' to compute the product."
choice = gets.chomp.downcase


if choice == 'p'
  puts "The product of the numbers between 1 and #{integer} is #{product(integer)}."
else
  puts "The sum of the numbers between 1 and #{integer} is #{sum(integer)}."
end