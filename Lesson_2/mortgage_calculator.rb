# Car Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('mortg_calculator.yml')

def prompt(string) # adds => to string
  Kernel.puts('=> ' + string)
end

def valid_amount?(str) # Validates inputs
  !str.empty? && str.to_f > 0 && (str.match(/[A-Za-z]/) ? true : false) == false
end

def valid_apr(str)
  !str.empty? && (str.match(/[A-Za-z]/) ? true : false) == false && str.to_f.between?(0, 99)
end

def valid_duration(str)
  !str.empty? && (str.match(/[A-Za-z]/) ? true : false) == false && str.to_i > 0 && str.to_i == str.to_f 
end

def valid_inp?(str)
  str == 'y' || str == 'n'
end

prompt(MESSAGES['welcome_part1'])
prompt(MESSAGES['welcome_part2'])

loop do # main loop
  loan_amount = nil

  loop do # collect loan amount and validate input
    prompt(MESSAGES['loan_amount_input'])
    loan_amount = gets.chomp()
    break if valid_amount?(loan_amount)
    prompt(MESSAGES['not_valid_input'])
  end

  apr = nil

  loop do # collect apr and validate input
    prompt(MESSAGES['apr_input'])
    apr = gets.chomp()
    break if valid_apr(apr)
    prompt(MESSAGES['not_valid_input'])
  end

  duration = nil

  loop do # collect duration of years
    prompt(MESSAGES['duration_input'])
    duration = gets.chomp()
    break if valid_duration(duration)
    prompt(MESSAGES['not_valid_input'])
  end

  loan_amount_float = loan_amount.to_f() # convert loan amount to a float
  month_interest_rate = apr.to_f() / 12 / 100 # convert to monthly interest rate
  months_duration = duration.to_i() * 12 # convert year to months

  # calculate the monthly mortgage payment
  monthly_payment = if apr.to_f == 0
                      loan_amount_float / months_duration
                    else
                      loan_amount_float * (month_interest_rate /
                      (1 - (1 + month_interest_rate)**(-months_duration)))
                    end

  result_message = <<-MSG
  Your monthly payment would be
     $#{monthly_payment.round(2)} for #{months_duration.round()} months."
  MSG

  prompt(MESSAGES['calculating'])
  prompt(result_message)

  input = nil

  loop do
    prompt(MESSAGES['calc_again']) # ask if they would like to calculate again
    input = gets.chomp().downcase()
    break if valid_inp?(input)
    prompt(MESSAGES['calc_again_error'])
  end

  if input == 'y'
    system('clear') || system('cls')
  else
    prompt(MESSAGES['powering_off'])
    break
  end
end
