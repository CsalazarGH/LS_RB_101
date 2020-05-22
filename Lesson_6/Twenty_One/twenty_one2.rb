require 'yaml'
MESSAGES = YAML.load_file('twenty_one_messages.yml')

CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
CARD_SUITES = ['H', 'D', 'S', 'C']
BUST_VALUE = 21
LINE = '-----------------------------------------------------'
INSTRUCTIONS1 = <<-MSG
The goal of each round is to have the highest valued hand.
=> You will be dealt two cards, and can choose to hit or stay.
=> If you hit, you will be dealt 1 card. If you stay, it goes to the dealers turn.
MSG
INSTRUCTIONS2 = <<-MSG
If your hand value goes over 21, you bust and loose the round.
=> Number Cards are worth their number. Jack, Queen, King are 10.
=> Aces are 11 for the first ace. Every ace is worth 1 after.
=> First player to win 5 rounds wins the match!
MSG

def instructions
  prompt(INSTRUCTIONS1)
  prompt(LINE)
  prompt("Press any key for the next set of instructions")
  1.times { ans = gets.chomp }
  system("clear") || system('cls')
  prompt(INSTRUCTIONS2)
  prompt(LINE)
end

def display_score(score)
  prompt("SCOREBOARD - Player: #{score[0]} Dealer: #{score[1]}")
end

def welcome_player
  prompt("Welcome to the game of Twenty-One!")
end

def display_hand_value(hand)
  prompt("Current Hand value is #{calculate_hand_value(hand)} (Over 21 is BUST)")
end

def convert_hand(hand) # [["C", 3], ["D", 8], ["S", "Q"], ["D", 2]]
  suits = { 'C' => 'Clubs', 'D' => 'Diamonds',
            'S' => 'Spades', 'H' => 'Hearts' }
  specials = { 'J' => 'Jack', 'Q' => 'Queen',
               'K' => 'King', 'A' => 'Ace' }
  converted = []

  hand.each do |card|
    converted << [suits[card[0]], card[1].is_a?(String) ? specials[card[1]] : card[1]]
  end

  converted.map do |card|
    "#{card[1]} of #{card[0]}"
  end
end

def and_or_comma(hand)
  if hand.size < 2
    hand.join(" and ")
  else
    hand[0..-2].join(', ') + ' and ' + hand[-1]
  end
end

def display_hands(phand, dhand, num = 1)
  converted_player = and_or_comma(convert_hand(phand))
  converted_dealer = and_or_comma(convert_hand(dhand))

  if num == 2
    prompt("Dealers hand is #{converted_dealer}")
    prompt("Players hand is #{converted_player}")
  else
    prompt("Dealers hand is #{convert_hand(dhand)[0]} and an unknown card.")
    prompt("Players hand is #{converted_player}")
  end
end

def display_hand(hand)
  converted_hand = and_or_comma(convert_hand(hand))
  prompt("Dealers hand is #{converted_hand}")
end

def deal_card(dck, num = 1)
  if num == 1
    dck.shuffle!.pop
  else
    cards = dck.sample(2)
    dck.keep_if { |card| !cards.include?(card) }
    cards
  end
end

def need_instructions?
  prompt(MESSAGES["need_instructions"])
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if ['y', 'n'].include?(ans)
    prompt(MESSAGES["enter_y_o_n"])
  end
  if ans == 'y'
    system('clear') || system('cls')
    instructions
  end
end

def start_game
  prompt(MESSAGES["press_any_key"])
  ans = ''
  1.times { ans = gets.chomp }
end

def initalize_deck
  CARD_SUITES.product(CARD_VALUES)
end

def prompt(str)
  puts "=> #{str}"
end

def calculate_hand_value(hand) # [["S", "Q"], ["H", "7"]]
  aces = []
  others = []

  hand.each do |card|
    card.include?('A') ? (aces << card) : (others << card)
  end

  aces.map!.with_index do |_, index|
    index == 0 ? (11) : (1)
  end

  others.map! do |card|
    ['Q', 'K', 'J'].include?(card[1]) ? (10) : (card[1])
  end

  (aces + others).sum
end

def hit_or_stay
  prompt(MESSAGES["hit_or_stay"])
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if ['h', 's'].include?(ans)
    prompt(MESSAGES["enter_h_o_s"])
  end
  ans
end

def bust?(value, option)
  value > option ? true : false
end

def next_round
  prompt(MESSAGES["press_any_key2"])
  ans = nil
  1.times { ans = gets.chomp }
  ans
end

def between_17_21(value)
  value.between?(17, 21)
end

def see_next_dealt
  prompt(MESSAGES["dealer_hit_message"])
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if ans == 'go'
    prompt(MESSAGES["inv_enter_go"])
  end
  ans
end

def winner_or_tie(player_value, dealer_value)
  case player_value <=> dealer_value
  when 1 then  'player'
  when -1 then 'dealer'
  else 'tie'
  end
end

def display_winner_n_score(scenario, player_value, dealer_value)
  score = "Player Value: #{player_value} Dealer Value: #{dealer_value}"
  case scenario
  when 'player' || 'dealer'
    prompt("#{scenario.capitalize} won this round!" + " #{score}")
  else
    prompt("It was a tie! Player Value: #{player_value} Dealer Value: #{dealer_value}")
  end
end

def display_round_winner(score)
  case score[0]
  when 5 then prompt("Player won this Match! Player Score: #{score[0]} - Dealer Score: #{score[1]}")
  else prompt("Dealer won this Match! Dealer Score: #{score[1]} - Player Score: #{score[0]}")
  end
end

def play_again?
  prompt(MESSAGES["play_again"])
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if ['y', 'n'].include?(ans)
    prompt(MESSAGES["enter_y_o_n"])
  end
  ans
end

def round_winner_point(round_result, score_board)
  if round_result == 'player'
    score_board[0] += 1
  elsif round_result == 'dealer'
    score_board[1] += 1
  end
end

round_counter = 1

loop do # MAIN GAME LOOP
  system('clear') || system('cls')
  score_board = [0, 0] # PLAYER SCORE IS IDX 0, DEALER IS IDX[1]
  welcome_player
  need_instructions? if round_counter == 1
  start_game

  loop do # ROUND LOOP
    system('clear') || system('cls')
    round_counter += 1
    deck = initalize_deck # Creates a new 52 card deck each round
    player_value = 0
    dealer_value = 0
    player_hand = deal_card(deck, 2)
    dealer_hand = deal_card(deck, 2)
    display_score(score_board)
    prompt(LINE)

    loop do # Player Loop
      player_value = calculate_hand_value(player_hand)
      display_hands(player_hand, dealer_hand, 1)
      display_hand_value(player_hand)
      break if bust?(player_value, BUST_VALUE)
      hit_or_stay == 'h' ? player_hand += [deal_card(deck)] : break
      system('clear') || system('cls')
    end

    if bust?(player_value, BUST_VALUE)
      prompt(LINE)
      prompt("You Busted! Your hand value is #{player_value}")
      score_board[1] += 1
      break if score_board[1] == 5
      next if next_round
    end
    loop do # Dealer LOOP
      system('clear') || system('cls')
      dealer_value = calculate_hand_value(dealer_hand)
      display_hand(dealer_hand)
      display_hand_value(dealer_hand)
      break if bust?(dealer_value, BUST_VALUE)

      if between_17_21(dealer_value)
        prompt(MESSAGES["dealer_stay"])
        break
      end

      dealer_hand += [deal_card(deck, 1)]
      see_next_dealt
    end

    if bust?(dealer_value, BUST_VALUE)
      prompt(LINE)
      prompt("Dealer Busted! Dealer hand value is #{dealer_value}")
      score_board[0] += 1
      break if score_board[0] == 5
      next if next_round
    end

    round_result = winner_or_tie(player_value, dealer_value)
    round_winner_point(round_result, score_board)
    display_winner_n_score(round_result, player_value, dealer_value)
    break if score_board.include?(5)
    next_round
  end
  prompt(LINE)
  display_round_winner(score_board)
  break if play_again? == 'n'
end
