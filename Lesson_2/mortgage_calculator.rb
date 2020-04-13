# Car Loan Calculator

require 'yaml'
MESSAGES = YAML.load_file('mortg_calculator.yml')

def prompt(string) # adds => to string
  Kernel.puts('=> ' + string)
end

def valid_input(str) # Validates inputs
  !str.empty? && str.to_f > 0 && !str.match(/A-Za-z/)
end

prompt(MESSAGES['welcome_part1'])
prompt(MESSAGES['welcome_part2'])

loop do # main loop
  loan_amount = nil

  loop do # collect loan amount and validate input
    prompt(MESSAGES['loan_amount_input'])
    loan_amount = gets.chomp()
    break if valid_input(loan_amount)
    prompt(MESSAGES['not_valid_input'])
  end

  apr = nil

  loop do # collect apr and validate input
    prompt(MESSAGES['apr_input'])
    apr = gets.chomp()
    break if valid_input(apr)
    prompt(MESSAGES['not_valid_input'])
  end

  duration = nil

  loop do # collect duration of years
    prompt(MESSAGES['duration_input'])
    duration = gets.chomp()
    break if valid_input(duration)
    prompt(MESSAGES['not_valid_input'])
  end

  loan_amount_float = loan_amount.to_f() # convert loan amount to a float
  month_interest_rate = apr.to_f() / 12 / 100 # convert to monthly interest rate
  months_duration = duration.to_f() * 12 # convert years to months

  # calculate the monthly mortgage payment
  monthly_payment = loan_amount_float *
                    (month_interest_rate /
                    (1 - (1 + month_interest_rate)**(-months_duration)))

  result_message = <<-MSG
  Your monthly payment would be
     $#{monthly_payment.round(2)} for #{months_duration.round()} months."
  MSG

  prompt(MESSAGES['calculating'])
  prompt(result_message)

  prompt(MESSAGES['calc_again']) # ask if they would like to calculate again
  input = gets.chomp().downcase()

  if input == 'n'
    prompt(MESSAGES['powering_off'])
    break
  end
end
