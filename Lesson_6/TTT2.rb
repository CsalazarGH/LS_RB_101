INITAL_MARKER = ' '
PLAYER_MAKER = 'X'
COMPUTER_MARKER = 'O'


XXX = 'XXX'
OOO = 'OOO'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITAL_MARKER }
end

def joinor(array)
  if array.size <= 2
    array.join(' or ')
  else
    array[0..-2].join(', ') + ' or ' + array[-1].to_s
  end
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Invalid Choice.")
  end
  brd[square] = PLAYER_MAKER
end

def possible_win_square(brd, str) 
  scenarios = [[brd[1], brd[2], brd[3]], [brd[4], brd[5], brd[6]], [brd[7], brd[8], brd[9]], 
              [brd[1], brd[4], brd[7]], [brd[2], brd[5], brd[8]], [brd[3], brd[6], brd[9]],
              [brd[1], brd[5], brd[9]], [brd[3], brd[5], brd[7]]]

  matcher = { 0 => {1 => brd[1], 2 => brd[2], 3 => brd[3]},
              1 => {4 => brd[4], 5 => brd[5], 6 => brd[6]},
              2 => {7 => brd[7], 8 => brd[8], 9 => brd[9]}, 
              3 => {1 => brd[1], 4 => brd[4], 7 => brd[7]}, 
              4 => {2 => brd[2], 5 => brd[5], 8 => brd[8]},
              5 => {3 => brd[3], 6 => brd[6], 9 => brd[9]},
              6 => {1 => brd[1], 5 => brd[5], 9 => brd[9]},
              7 => {3 => brd[3], 5 => brd[5], 7 => brd[7]} }


  result = false 

  scenarios.each_with_index do |scen, index|
    if scen.sort.join == str
      result = matcher[index].key(' ')
      break
    else 
      result = false
    end
  end
  result 
end


def computer_places_piece(brd)
  square =  if empty_squares(brd).include?(5) 
              5
            elsif possible_win_square(brd, ' OO') != false
              possible_win_square(brd, ' OO')
            elsif possible_win_square(brd, ' XX') != false
              possible_win_square(brd, ' XX')
            else
               empty_squares(brd).sample
            end
          
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winning_line?(brd) 
  winner = ['XXX', 'OOO']
  
  scenarios = [[brd[1], brd[2], brd[3]], [brd[4], brd[5], brd[6]], [brd[7], brd[8], brd[9]], 
               [brd[1], brd[4], brd[7]], [brd[2], brd[5], brd[8]], [brd[3], brd[6], brd[9]],
               [brd[1], brd[5], brd[9]], [brd[3], brd[5], brd[7]]]
  string = ''

  scenarios.each do |scen|
    if winner.include?(scen.join)
      string = scen.join
    end
  end

  string
end

def place_piece!(brd, current_player)
  current_player == 'user' ? player_places_piece(brd) : computer_places_piece(brd)
end

def alternate_player(current_player)
  current_player == 'computer' ? 'user' : 'computer'
end

def play_again?
  answer = ''
  loop do 
    prompt('Do you want to play again? Y or N:')
    answer = gets.chomp.downcase
    break if ['n','y'].include?(answer)
    prompt('Thats not a valid input.')
  end
  answer 
end

def first_player?
  input = ''
  loop do
    prompt('Who goes first? Enter user, computer or choose.')
    input = gets.chomp.downcase
    break if ['user','computer','choose'].include?(input)
    prompt ('Invalid input!')
  end
  
  case input
  when 'user' then return 'user'
  when 'computer' then return 'computer'
  else return ['user','computer'].sample
  end
end


board = initialize_board
w_line = ''
current_player = ''
user_wins = 0
comp_wins = 0
winner = ''

loop do

  loop do
    current_player = first_player?
    loop do
      display_board(board) if current_player == 'user'
      place_piece!(board, current_player) 
      w_line = winning_line?(board) 
      current_player = alternate_player(current_player) 
      break if [XXX, OOO].include?(w_line) || board_full?(board) 
    end

    display_board(board)

    if w_line == XXX
      user_wins += 1
      prompt("User won!")
      prompt("User win count: #{user_wins}")
      prompt("Computer win count: #{comp_wins}")
      board = initialize_board 
      winner = 'user' if user_wins == 5
    elsif w_line == OOO
      comp_wins += 1
      prompt("Computer won!")
      prompt("User win count: #{user_wins}")
      prompt("Computer win count: #{comp_wins}")
      board = initialize_board 
      winner = 'computer' if comp_wins == 5
    else
      prompt("Board FULL. Nobody won.")
      board = initialize_board 
    end

    break if winner != ''
  end

  case winner
  when 'user' then prompt("USER WON THIS ROUND! #{user_wins} to #{comp_wins}")
  when 'computer' then prompt("Computer WON THIS ROUND! #{comp_wins} to #{user_wins}")
  end

  ans = play_again?

  if ans == 'n'
    break
  else
    w_line = '' 
    board = initialize_board 
    user_wins = 0
    comp_wins = 0
    winner = ''
    system('clear') || system('cls')
  end
  
end
