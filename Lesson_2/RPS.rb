# Rock Paper Scissors

CHOICES = ['rock', 'paper', 'scissors']

def prompt(string) # adds => to string
  puts '=> ' + string
end

def welcome_to_game
  prompt('Welcome to the game of Rock, Paper, Scissors.')
end

def instructions_to_play
  prompt("The game is simple")
  prompt("Paper beats rock")
  prompt("Rock beats scissors")
  prompt("Scissors beats paper")
  prompt('- - - - - - - - - - -')
end

def know_to_play?
  answer = nil
  loop do
    prompt('Do you know how to play? (Enter Y or N)')
    answer = gets.chomp()
    break if answer.downcase == 'y' || answer.downcase == 'n'
    prompt('Please enter Y or N')
  end
  answer
end

def get_ready_to_play(string)
  if string == 'n'
    instructions_to_play
  else
    prompt("Lets Play!")
  end
end

def computers_choice(array)
  array.sample
end

def collect_player_choice
  answer =nil
  loop do
    prompt('Enter rock, paper or scissors')
    answer = gets.chomp
    break if pchoice_valid?(answer)
    prompt('Invalid input, please enter rock, paper or scissors.')
  end
  answer
end

def pchoice_valid?(string)
  CHOICES.include?(string.downcase)
end

def decide_winner(pchoice, bchoice)
  case pchoice
  when 'rock'
    if bchoice == 'rock'
      prompt('You both chose the same thing!')
    elsif bchoice == 'paper'
      prompt('Bot won! It chose paper')
    else
      prompt('You won! Bot chose scissors.')
    end
  when 'paper'
    if bchoice == 'rock'
      prompt('You won! Bot chose rock!')
    elsif bchoice == 'paper'
      prompt('You both chose the same thing!')
    else
      prompt('You lost! Bot chose scissors!')
    end
  when 'scissors'
    if bchoice == 'rock'
      prompt('You lost! Bot chose rock.')
    elsif bchoice == 'paper'
      prompt('You won! Bot chose paper.')
    else
      prompt('You both chose scissors! Play again.')
    end
  end
end

def play_again?
  answer = nil
  loop do
    prompt('Do you want to play again? (Y or N)')
    answer = gets.chomp
    break if answer.downcase == 'y' || answer.downcase == 'n'
    prompt('Invalid answer! Please enter Y or N')
  end
  answer
end

welcome_to_game # Welcomes player to game
ready_or_not = know_to_play? # Asks player if they know how to play
get_ready_to_play(ready_or_not) # Puts instructions or lets play

loop do
  bot_choice = computers_choice(CHOICES) # Chooses random bot choice
  player_choice = collect_player_choice # Collects player choice
  decide_winner(player_choice, bot_choice)
  play_again_choice = play_again?

  if play_again_choice == 'n'
    prompt("Have a good day! It was fun playing!")
    break
  else
    system('clear') || system('cls')
  end
end
