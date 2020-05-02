# TIC TAC TOE GAME
board = ["---", "---", '---'] 

ROW_CHOICES = ['top','middle','bottom']
SQUARE_CHOICES = ['left', 'middle', 'right']
POSSIBLE_PLAYS = [['top','left'], ['top','middle'],['top','right'],
                  ['middle','left'], ['middle','middle'], ['middle','right'],
                  ['bottom','left'], ['bottom','middle'], ['bottom','right']]  


def collect_user_mark
  puts "Would you like to be X or O?"
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if answer == 'o' || answer == 'x'
    puts "That doesn't look right. Please select X or O"
  end
  answer 
end

def generate_computer_mark(user)
  user == 'x'? 'o' : 'x'
end

def get_player_move
  row = nil
  square = nil 
  loop do
  puts "Enter a row (top, middle or bottom):"
  loop do
    row = gets.chomp.downcase
    break if ROW_CHOICES.include?(row)
    puts "That doesn't look right, please enter top, middle or bottom"
  end
  puts "Enter a square (left, middle, or right):"
  loop do
    square = gets.chomp.downcase
    break if SQUARE_CHOICES.include?(square)
    puts "That doesn't look right, please enter left, middle or right"
  end
  break if POSSIBLE_PLAYS.include?([row, square])
  puts "That move was already used, please select a different move."
  end
  [row, square]
end

def generate_computer_move
  POSSIBLE_PLAYS.sample
end

def convert_choice(array)
string = case array[0]
         when 'top' then 0
         when 'middle' then 1
         when 'bottom' then 2
         end

spot = case array[1]
       when 'left' then 0
       when 'middle' then 1
       when 'right' then 2
       end

[string, spot]     
end

def win?(gameboard, pmark, cmark)
 new_gameboard = gameboard.map do |string|
                 string.gsub(cmark, '-')
                 end

 new_gameboard.map! do |string|
  string.gsub(pmark, 'x')
 end

 if new_gameboard.include?('xxx')
  return true
 elsif new_gameboard[0][0] == 'x' && new_gameboard[1][0] == 'x' && new_gameboard[2][0] == 'x'
  return true
 elsif new_gameboard[0][1] == 'x' && new_gameboard[1][1] == 'x' && new_gameboard[2][1] == 'x'
  return true
 elsif new_gameboard[0][2] == 'x' && new_gameboard[1][2] == 'x' && new_gameboard[2][2] == 'x'
  return true
 elsif new_gameboard[0][0] == 'x' && new_gameboard[1][1] == 'x' && new_gameboard[2][2] == 'x'
  return true
 elsif new_gameboard[0][2] == 'x' && new_gameboard[1][1] == 'x' && new_gameboard[2][0] == 'x'
  return true
 else
  return false
 end
 
end



BOARD = ["---", "---", '---'] 

loop do #Main Game Loop
  puts "Lets play TIC TAC TOE!"

  user_mark = collect_user_mark #Collects user mark , either x or o

  computer_mark = generate_computer_mark(user_mark) #Generates computers mark , opposite of users mark
  
  puts "The game is starting!"

  loop do
    player_move = get_player_move #["top","left"]
    POSSIBLE_PLAYS.delete_if {|move| move == player_move}
    player_move_converted = convert_choice(player_move)
    BOARD[player_move_converted[0]][player_move_converted[1]] = user_mark

    player_win = win?(BOARD, user_mark, computer_mark)
    more_choices = POSSIBLE_PLAYS.empty?

      if player_win == true
        puts "The player won! Game is over"
        puts BOARD
        break
      end

      if more_choices == true
        puts "Game is a tie! Nobody one!"
        break
      end

    computer_move = generate_computer_move
    POSSIBLE_PLAYS.delete_if {|move| move == computer_move}
    comp_move_converted = convert_choice(computer_move) 
    BOARD[comp_move_converted[0]][comp_move_converted[1]] = computer_mark
    computer_win = win?(BOARD, computer_mark, user_mark)
    more_choices2 = POSSIBLE_PLAYS.empty?
    
    if computer_win == true
      puts "The computer won! Game is over"
      puts BOARD
      break
    end

    if more_choices2 == true
      puts "Game is a tie! Nobody one!"
      puts BOARD
      break
    end

    puts BOARD
  end


  puts "Would you like to play again? Enter Y or N"
  play_again = gets.chomp.downcase

  if play_again == 'y'
    POSSIBLE_PLAYS = [['top','left'], ['top','middle'],['top','right'],
                  ['middle','left'], ['middle','middle'], ['middle','right'],
                  ['bottom','left'], ['bottom','middle'], ['bottom','right']]  
    BOARD = ["---", "---", '---'] 
    system('clear') || system('cls')
  else
    puts "Goodbye!"
    break
  end
end

