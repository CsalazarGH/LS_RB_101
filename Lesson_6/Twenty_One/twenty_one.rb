CARD_VALUES = [2,3,4,5,6,7,8,9,10,'J','Q','K','A']
CARD_SUITES = ['H', 'D', 'S', 'C']

def initalize_deck(c, s)
  s.product(c)
end

def prompt(str)
 puts "=> #{str}"
end

def ready_to_play?
prompt("Want to play Twenty-One? Y or N:")
answer = nil
  loop do
    answer = gets.chomp.downcase
    break if ['y','n'].include?(answer)
  end
answer
end

def calculate_hand_value(hand) #[["S", "Q"], ["H", "7"]]
  aces = []
  others = []

  hand.each do |card|
    if card.include?('A')
      aces << card
    else
      others << card
    end
  end

  aces.map!.with_index do |ace,index|
    index == 0 ? 11 : 1
  end

  others.map! do |card|
    if ['Q', 'K', 'J'].include?(card[1])
      10
    else
      card[1]
    end
  end
  (aces + others).sum
end

def hit_or_stay
  prompt ("Do you want to hit or stay? H or S:")
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if ['h','s'].include?(answer)
    prompt("Invlid input. Please enter H or S")
  end
answer
end

def convert_hand(hand) #[["C", 3], ["D", 8], ["S", "Q"], ["D", 2]]
  suits = {'C' => 'Clubs', 'D' => 'Diamonds', 'S' => 'Spades', 'H' => 'Hearts'}
  specials = {'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace'}
  converted = []

  hand.each do |card|
    converted << [suits[card[0]], card[1].is_a?(String) ? specials[card[1]] : card[1]]
  end

  converted.map do |card|
    "#{card[1]} of #{card[0]}"
  end
end

def and_commas(hand) # ["10 of Hearts", "Ace of Diamonds"]
  if hand.size < 2  
    hand.join(" and ") 
  else
    hand[0..-2].join(', ') + ' and ' + hand[-1]
  end
end

def display_players_hand(phand, value)
  prompt("Your current hand is #{and_commas(phand)}.")
  prompt("Your current value is: #{value} (Over 21 busts)")
end

def display_dealers_hand1(dhand)
  prompt("Dealers hand is #{dhand[0]} and an unkown card.")
end

def display_dealers_hand2(dhand, value)
  prompt("Dealers current hand is #{and_commas(dhand)}")
  prompt ("Dealer's current value is: #{value}")
end

def deal_card(dck, num = 1)
  if num == 1 
    dck.shuffle!.pop 
  else
    p_hand = dck.sample(2)
    dck -= p_hand
    c_hand = dck.sample(2)
    dck -= p_hand
    [p_hand, c_hand]
  end
end

def play_again?
  prompt("Do you want to play again? Y or N:")
  ans = ''
  loop do
    ans = gets.chomp.downcase
    break if ['y','n'].include?(ans)
    prompt("Invalid input. Please enter Y or N")
  end
  ans
end

def see_next_dealt
  prompt ("Dealer is going to hit, type GO to see next card dealt!")
  ans = ''
  loop do 
    ans = gets.chomp.downcase
    break if ans == 'go'
    prompt("Invalid input, enter GO")
  end
  ans 
end

def round_winner?(p_value, d_value, score)
  case p_value <=> d_value
  when +1 
    prompt("Player Won this round!!")
    score[0] += 1
  when -1 
    prompt("Dealer Won this round!!")
    score[1] += 1
  else 
    prompt("It was a tie!")
  end
end

def bust?(value)
  value > 21 ? true : false
end

def won_5_rounds(score)
  score == 5 ? true : false
end

def match_winner(score)
  if score[1] == 5
    prompt("Dealer WON THE MATCH! #{display_score(score)}")
  else
    prompt("Player WON THE MATCH!  #{display_score(score)}")
  end
end

def next_round
  prompt("Press any key to start the next round.")
  ans = nil
  loop do
    ans = gets.chomp
    break
  end
  ans
end

def display_score(score)
  prompt("ScoreKeeper - Player: #{score[0]}, Dealer Score: #{score[1]}")
end

loop do
  score = [0, 0]
loop do
  system('clear') || system('cls')
  deck = initalize_deck(CARD_VALUES, CARD_SUITES) #Creates a new deck of cards
  player_value = 0 
  dealer_value = 0
  player_hand, dealer_hand = deal_card(deck, 2)[0], deal_card(deck, 2)[1] # Initalizes dealer and players handss
  player_bust = false  
  dealer_bust = false 
  display_score(score)
  prompt('----------------------------------------------')

  loop do #player loop
    player_value = calculate_hand_value(player_hand) 
    display_dealers_hand1(convert_hand(dealer_hand)) 
    display_players_hand(convert_hand(player_hand), player_value) 
    if player_value > 21
      prompt("You went over 21! BUST! You lose this round!")
      player_bust = true
      score[1] += 1
      break
    end
    hit_or_stay == 'h' ? (player_hand = player_hand + [deal_card(deck)]) : (break)
  end
  
  #Check if anybody won, if yes, BREAK LOOP
  if won_5_rounds(score[1])
    break
  end

  if player_bust == true
    if next_round != nil
      player_value = 0 
      player_bust = false 
      next
    end
  end

  system('clear') || system('cls')

  loop do #Dealer ROUND
    dealer_value = calculate_hand_value(dealer_hand) 
    display_dealers_hand2(convert_hand(dealer_hand), dealer_value)
    if (dealer_value <= 21) && (dealer_value >= 17)
      prompt("Dealer decides to stay!")
      break
    end
    if dealer_value > 21
      prompt("Dealer went over 21! BUST! Dealer loses! Player WINS!")
      dealer_bust = true
      score[0] += 1
      break
    end
    dealer_hand = dealer_hand + [deal_card(deck)]
    see_next_dealt
  end

  #Check if anybody won, break loop if TRUE
  if won_5_rounds(score[0])
    break
  end
  
  if dealer_bust == true
    if next_round != nil
      player_value = 0 
      dealer_value = 0
      dealer_bust = false 
      next
    end
  end

  round_winner?(player_value, dealer_value, score)

  break if won_5_rounds(score[0]) || won_5_rounds(score[1])

  if next_round != nil
    player_value = 0 
    dealer_value = 0
    next
  end

end
  prompt('----------------------------------------------')
  match_winner(score)
  score[0], score[1] = 0, 0
  play_again? == 'y' ? next : break
end