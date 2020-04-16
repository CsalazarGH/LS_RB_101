# Rock Paper Scissors -  VIDEO EDITION
system('clear') || system('cls') # Clears screen before starting game

CHOICE_OPTIONS = ['rock', 'paper', 'scissors', 'lizard', 'spock']
CHOICE_OPT_ABV = ['r', 'p', 's', 'l', 'sp']
WINNING_SCENARIOS = { 'rock' => ['scissors', 'lizard'],
                      'paper' => ['rock', 'spock'],
                      'scissors' => ['lizard', 'paper'],
                      'lizard' => ['paper', 'spock'],
                      'spock' => ['rock', 'scissors'] }

def prompt(message) # Displays message with =>
  Kernel.puts("=> #{message}")
end

def welcome # Displays welcome message
  prompt("Welcome to RPS! (Lizard Spock Edition)")
  prompt("First to win 5 rounds (1 match), is the grand winner! ")
  prompt("-------------------------------------")
end

def collect_player_choice # collects & validates players input
  answer = nil
  loop do
    prompt("Choose a play: #{CHOICE_OPTIONS.join(', ')}")
    prompt('You can also enter R, P, S, L, SP for short!')

    answer = Kernel.gets().chomp().downcase

    if CHOICE_OPTIONS.include?(answer)
      break
    elsif CHOICE_OPT_ABV.include?(answer)
      answer = CHOICE_OPTIONS[CHOICE_OPT_ABV.index(answer)]
      break
    else
      prompt('Invalid input!')
    end
  end

  answer
end

def generate_bot_choice # Generates random bot choice
  CHOICE_OPTIONS.sample
end

def win?(first, second) # Returns true if first argument beats second argument
  WINNING_SCENARIOS[first].include?(second)
end

player_score = 0
bot_score = 0

def displays_winner_message(pchoice, bchoice)
  if win?(pchoice, bchoice)
    prompt("Player wins! #{pchoice} beats #{bchoice}!")
  elsif win?(bchoice, pchoice)
    prompt("Bot wins! #{bchoice} beats #{pchoice}!")
  else
    prompt("It was a tie! Both chose #{pchoice}")
  end
end

def play_again?
  answer = nil
  loop do
    prompt("Do you want to start a new match? (Enter Y or N)")
    answer = Kernel.gets().chomp().downcase
    break if answer == 'y' || answer == 'n'
    prompt("Invalid input!")
  end
  answer
end

welcome # Displays welcome message

loop do # main loop for game
  player_choice = collect_player_choice # collects player choice and assigns
  bot_choice = generate_bot_choice # assigns bot choice as random choice
  displays_winner_message(player_choice, bot_choice) # Displays who won round

  if win?(player_choice, bot_choice) # adds points to winners scorecount
    player_score += 1
  elsif win?(bot_choice, player_choice)
    bot_score += 1
  end

  prompt("Players score: #{player_score}") # Displays winners scores
  prompt("Bots score: #{bot_score}")
  prompt("-------------------------------")
  prompt("                               ")

  if player_score == 5
    prompt("Player won! Player is the grand winner!")
    player_score = 0
    bot_score = 0
    play_again = play_again?
  elsif bot_score == 5
    prompt("Bot won! Player is the grand winner!")
    player_score = 0
    bot_score = 0
    play_again = play_again?
  end

  if play_again == 'y'
    system('clear') || system('cls')
  elsif play_again == 'n'
    prompt("It was fun playing! Goodbye!")
    break
  end
end
