# Lesson 2 - First Basic Calculator


Kernel.puts("Please enter your first number:")
number1 = Kernel.gets().chomp().to_i

Kernel.puts("Please enter your second number:")
number2 = Kernel.gets().chomp().to_i

Kernel.puts("Please enter the type of operation to perform.")
Kernel.puts("Enter add, subtract, multiply or divide:")

operation = Kernel.gets().chomp().downcase

case operation
when 'add'
  Kernel.puts("#{number1} + #{number2} = #{number1 + number2}")
when 'subtract'
  Kernel.puts("#{number1} - #{number2} = #{number1 - number2}")
when 'multiply'
  Kernel.puts("#{number1} * #{number2} = #{number1 * number2}")
else
  Kernel.puts("#{number1} / #{number2} = #{number1.to_f / number2.to_f}")
end
