# Lesson 2 - First Basic Calculator
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i.to_s. == num
end

def operation_to_message(string)
  case string
  when 'add'
    'adding'
  when 'subtract'
    'subtracting'
  when 'multiply'
    'multiplying'
  else
    'dividing'
  end
end

number1 = nil
number2 = nil
name = nil
operation = nil

prompt("Welcome to Calculator! Enter your name:")

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  loop do # get your first number and validate it
    prompt("Please enter your first number:")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  loop do # get your second number and validate it
    prompt("Please enter your second number:")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number")
    end
  end

  operator_prompt = <<-MSG # Mesage to display when asking operator choice
    Please enter the type of operation to perform.
    - Add (enter 'add')
    - Subtract (enter 'subtract')
    - Multiply (enter 'multiply')
    - Divide (enter 'divide')
    MSG

  prompt(operator_prompt)

  loop do # Collects operator and validates input
    operation = Kernel.gets().chomp().downcase

    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("Please choose add, subtract, multiply or divide")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result =  case operation # calulcates result
            when 'add'
              number1.to_i() + number2.to_i()
            when 'subtract'
              number1.to_i() - number2.to_i()
            when 'multiply'
              number1.to_i() * number2.to_i()
            else
              number1.to_f() / number2.to_f()
            end

  prompt("The result is #{result}") # outputs result

  prompt("Do you want to calculate again? (Enter Y to calculate again):")

  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

puts "Powering off calculator...."
