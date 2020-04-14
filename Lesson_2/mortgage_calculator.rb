require 'yaml'
MESSAGES = YAML.load_file('mortg_calculator.yml')

def prompt(string) # adds => to string
  Kernel.puts('=> ' + string)
end

def valid_chars?(string) # makes sure input doesn't have letters, etc.
  valid_chars = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']
  string_array = string.split('') # returns array ['1', '2', '3', '5']
  string_array.all? { |char| valid_chars.include?(char) }
end

def valid_amount?(str) # Validates input for loan amount
  !str.empty? && valid_chars?(str) && str.to_f > 0
end

def valid_apr?(str) # validates input for APR
  !str.empty? && valid_chars?(str) && str.to_f.between?(0, 99)
end

def valid_duration?(str) # Validates input for valid_duration
  !str.empty? && valid_chars?(str) && str.to_i == str.to_f && str.to_i > 0
end

def collect_input(input_type) # Collects input for all 3
  input = nil
  loop do
    prompt(MESSAGES[input_type])
    input = gets.chomp
    break if valid_in?(input, input_type)
    prompt(MESSAGES['not_valid_input'])
  end
  input
end

def valid_in?(input, input_type) # Validates data depending on type
  case input_type
  when "loan_amount_input"
    valid_amount?(input)
  when "apr_input"
    valid_apr?(input)
  else
    valid_duration?(input)
  end
end

def months(years) # Converts years to months
  years * 12
end

def calc_payment(amount, rate, mnths) # Calculates payment if int > 0
  result = amount * (rate / (1 - (1 + rate)**(-mnths)))
  result.round(2)
end

def calc_payment_no_int(amount, mnths) # Calculates payment if int == 0
  result = amount / mnths
  result.round(2)
end

def valid_again_input?(string) # Validats input
  string.downcase == 'y' || string.downcase == 'n'
end

loop do # Main Loop
  la = collect_input('loan_amount_input').to_f() # Loan Amount
  month_apr = (collect_input('apr_input').to_f() / 100) / 12 # Monthly APR
  years = collect_input('duration_input').to_f() #  Years
  months = months(years) # Months of loan

  payment = if month_apr == 0.0 # Calculates payment for 0 interest
              calc_payment_no_int(la, months)
            else # Calculates payment with greater than 0 interest
              calc_payment(la, month_apr, months)
            end

  result_message = <<-MSG # Message to display with result
  Your monthly payment would be $#{payment}
     for #{months.round()} months.
  MSG

  prompt(MESSAGES['calculating']) # Displays "Calculating...."
  prompt(result_message)

  answer = nil

  loop do
    prompt(MESSAGES['calc_again'])
    answer = gets.chomp()
    break if valid_again_input?(answer)
    prompt(MESSAGES['calc_again_error'])
  end

  if answer == 'y'
    system('clear') || system('cls')
  else
    prompt(MESSAGES['powering_off'])
    break
  end
end
