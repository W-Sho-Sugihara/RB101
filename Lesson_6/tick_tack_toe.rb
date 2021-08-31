require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                 [1, 4, 7], [2, 5, 8], [3, 6, 9],
                 [1, 5, 9], [3, 5, 7]]
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
MATCH_TOTAL = 5
PLAYER_OPTIONS = {
  1 => 'player',
  2 => 'computer'
}
TURN_ORDER = {
  1 => 'alternating',
  2 => 'random'
}
SCORE = {
  'player' => 0,
  'computer' => 0,
  'tie' => 0
}
# rubocop:disable Layout/LineLength
# In the Bonus features assignment it said not to use global or instance variables,
# but I found this to be so much easier to access and manipulate.
# I know that constant hashes are not truly constant and unmutable and this may not be best practice.
# Which way of keeping score would be best practice?
# rubocop:enable Layout/LineLength

#-----Generic Functionality-----------

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  (1..9).each_with_object({}) { |num, hsh| hsh[num] = num }
end

def joinor(arr, punc = ',', last_punc = "or")
  array_with_punctuation = arr.map do |num|
    if arr[0] == num
      num.to_s
    elsif arr[-1] == num
      num.to_s.prepend(" #{last_punc} ")
    else num.to_s.prepend("#{punc} ")
    end
  end
  array_with_punctuation.join('')
end

def update_score(scorer)
  case scorer
  when 'Player'
    SCORE['player'] += 1
  when 'Computer'
    SCORE['computer'] += 1
  else
    SCORE['tie'] += 1
  end
end

def reset_score
  SCORE.each_key { |k| SCORE[k] = 0 }
end

#-----Welcoming display-------------

# rubocop:disable Metrics/AbcSize
def welcome
  puts '+' + ('-' * 13) + '+'
  puts '|' + (' ' * 13) + '|'
  puts '|' + " WELCOME!! ".center(13) + '|'
  puts '|' + (' ' * 13) + '|'
  puts '+' + ('-' * 13) + '+'
end
# rubocop:enable Metrics/AbcSize

#-----Request input-----------

def who_goes_first_if_alternating
  second_answer = nil
  loop do
    prompt "Who would you like to go first?"
    prompt "Please select one:"
    prompt "1: #{PLAYER_OPTIONS[1]}"
    prompt "2: #{PLAYER_OPTIONS[2]}"
    second_answer = gets.chomp.to_i
    break if second_answer == 1 || second_answer == 2
    prompt "Invalid entry."
    prompt "Please select one:"
    prompt "1: #{PLAYER_OPTIONS[1]}"
    prompt "2: #{PLAYER_OPTIONS[2]}"
  end
  second_answer
end

def decide_turn_order
  answer = nil
  loop do
    prompt "Would you like to alternate who goes first"
    prompt "or would you like each round to be random?"
    prompt "Please select one:"
    prompt "1: #{TURN_ORDER[1]}"
    prompt "2: #{TURN_ORDER[2]}"
    answer = gets.chomp.to_i
    break if answer == 1 || answer == 2
    prompt "Invalid entry."
    prompt "Please select options:"
    prompt "1: #{TURN_ORDER[1]}"
    prompt "2: #{TURN_ORDER[2]}"
  end
  answer
end

#--------Display on Screen-------------

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  puts "First player to win #{MATCH_TOTAL} games wins the match."
  puts "You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def display_score
  system 'clear'
  prompt "Current Score"
  prompt "Player: #{SCORE['player']}"
  prompt "Computer: #{SCORE['computer']}"
  prompt "Ties: #{SCORE['tie']}."
  # rubocop:disable Layout/LineLength
  # prompt "Player needs #{MATCH_TOTAL - SCORE['player']} more wins to win the match."
  # prompt "Computer need #{MATCH_TOTAL - SCORE['computer']} more wins to win the match."
  # rubocop:enable Layout/LineLength
end

def display_winner(board)
  if someone_won?(board)
    prompt "#{detect_winner(board)} wins!"
  else
    prompt "It's a tie!"
  end
end

def who_won_the_match
  prompt "#{(SCORE.key(MATCH_TOTAL)).capitalize} won the match!!"
end

#------Turn Order Logic-----------

def deciding_start(answer)
  return PLAYER_OPTIONS[who_goes_first_if_alternating] if answer == 1
  TURN_ORDER[2]
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else 'player'
  end
end

#---------Piece Placement---------------

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == num }
end

# rubocop:disable Layout/LineLength
def find_empty_square(brd, sub_array)
  brd.select { |key, _| sub_array.include?(key) && brd[key].class == Integer }.keys.first
end

def offence_defence(brd, marker)
  placement = nil
  WINNING_LINES.each do |sub_array|
    if brd.values_at(*sub_array).count(marker) == 2 && find_empty_square(brd, sub_array)
      placement = find_empty_square(brd, sub_array)
    end
  end
  placement
end
# rubocop:enable Layout/LineLength

def computer_places_piece!(brd)
  square = offence_defence(brd, 'O')
  if square.nil?
    square = offence_defence(brd, PLAYER_MARKER)
  end
  if square.nil? && brd[5] == 5
    square = 5
  elsif square.nil?
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Your turn. Please choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

#-------Piece Placement Execution-----------------

def place_piece!(board, current_player)
  if current_player == "player"
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

#-----------Winning Conditionals---------------------

# rubocop:disable Layout/LineLength
def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).select { |value| value == PLAYER_MARKER }.size == 3
      return 'Player'
    elsif brd.values_at(*line).select { |value| value == COMPUTER_MARKER }.size == 3
      return 'Computer'
    end
  end
  nil
end
# rubocop:enable Layout/LineLength

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

#----------Looping one game of match-----------

def one_game(board, starting_player)
  system 'clear'
  puts "#{starting_player.capitalize} goes first!"
  sleep(1.7)
  current_player = starting_player
  loop do
    display_score
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  display_score
  display_board(board)
end

def start_round(board, starting_player)
  one_game(board, starting_player)
  update_score(detect_winner(board))
  display_winner(board)
  sleep(2)
end

#--------Initial Greeting-------------

system "clear"
welcome
sleep(1.6)

#--------Match Loop Begins----------------

loop do
  board = initialize_board
  system 'clear'
  who_goes_first = deciding_start(decide_turn_order)
  sleep(1.2)
  starting_player = who_goes_first

  loop do
    if who_goes_first == 'random'
      starting_player = PLAYER_OPTIONS[rand(1..2)]
    end
    start_round(board, starting_player)
    board = initialize_board
    break if SCORE.values_at('player', 'computer').include?(MATCH_TOTAL)
    display_score
    starting_player = alternate_player(starting_player)
    sleep(3)
  end

  who_won_the_match
  prompt "Play again? (Y or N)"
  answer = gets.chomp.downcase
  break unless answer == "y"
  reset_score
end

system "clear"
prompt "Thanks for playing!!"
prompt ""
