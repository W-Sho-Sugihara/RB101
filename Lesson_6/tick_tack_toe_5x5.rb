require 'pry'

class String
  # colorization that I found on Stackoverflow that makes the visually more appealing.
  # I did cheat and copy & paste this code, but I do understand the concept of classes and 'self' 
  # but I do not understand all the regex yet :(
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def gray
    colorize(37)
  end
end

WINNING_LINES = {
  '3x3' => [],
  '5x5' => [],
  '9x9' => []
}
PLAYER_MARKER = 'X'.rjust(2, " ").red
PLAYER2_MARKER = 'S'.rjust(2, " ").green
PLAYER3_MARKER = 'R'.rjust(2, " ").pink
PLAYER4_MARKER = 'Y'.rjust(2, " ").gray
COMPUTER_MARKER = 'O'.rjust(2, " ").blue
COMPUTER2_MARKER = 'A'.rjust(2, " ").yellow
COMPUTER3_MARKER = 'K'.rjust(2, " ").light_blue

MATCH_LENGTH = 3
PLAYER_OPTIONS = {
  1 => 'player',
  2 => 'computer',
  3 => 'player2',
  4 => 'computer2'
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

#------------------------------------INITIALIZE BOARD---------------------------------------

def initialize_board(range, current_dimensions)
  range.each_with_object({}) { |num, hsh| hsh[num] = num }
end

#------------------------------INITIALIZE WINNING CONDITIONS-------------------------------

def initialize_winning_lines(current_dimensions)
  case current_dimensions
  when '3x3'
    initialize_winning_lines_for_3x3
  when '5x5'
    initialize_winning_lines_for_5x5
  when '9x9'
    initialize_winning_lines_for_9x9
  end
end

def push_to_winning_lines_multiple_times (base_array, number_of, key, increment_value)
    number_of.times do |i|
      base_array.each do |sub_array|
        WINNING_LINES[key] << sub_array.map { |value| value + (increment_value * i) }
      end
    end
end

def winning_rows_for_3x3
  rows_array = [[1, 2, 3]]
  push_to_winning_lines_multiple_times(rows_array, 3, '3x3', 3)
end

def winning_columns_for_3x3
  columns_array = [[1, 4, 7]]
  push_to_winning_lines_multiple_times(columns_array, 3, '3x3', 1)
end

def winning_diagonals_for_3x3
  diagonal_arrays = [[1, 5, 9], [3, 5, 7]]
  push_to_winning_lines_multiple_times(diagonal_arrays, 1, '3x3', 3)
end

def winning_rows_for_5x5
  # rows_array = [[1, 2, 3], [2, 3, 4], [3, 4, 5]] # init array for 3 in a row
  # push_to_winning_lines_multiple_times(rows_array, 5, '5x5', 5) # arguments for winning array for 3 in a row
  rows_array = [[1, 2, 3, 4], [2, 3, 4, 5]]
  push_to_winning_lines_multiple_times(rows_array, 5, '5x5', 5)
end

def winning_columns_for_5x5
  # columns_array = [[1, 6, 11], [2, 7, 12], [3, 8, 13], [4, 9, 14], [5, 10, 15]] # init array for 3 in a row
  # push_to_winning_lines_multiple_times(columns_array, 3, '5x5', 5) # arguments for winning array for 3 in a row
  columns_array = [[1, 6, 11, 16], [2, 7, 12, 17], [3, 8, 13, 18], [4, 9, 14, 19], [5, 10, 15, 20]]
  push_to_winning_lines_multiple_times(columns_array, 2, '5x5', 5)
end

def winning_diagonals_for_5x5
  # diagolan_array_left_to_right = [[1, 7, 13], [2, 8, 14], [3, 9, 15]] # init array for 3 in a row
  # diagolan_array_right_to_left = [[3, 7, 11], [4, 8, 12], [5, 9, 13]] # init array for 3 in a row
  # push_to_winning_lines_multiple_times(diagolan_array_left_to_right, 3, '5x5', 5) # arguments for winning array for 3
  # push_to_winning_lines_multiple_times(diagolan_array_right_to_left, 3, '5x5', 5) # arguments for winning array for 3

  diagolan_array_left_to_right = [[1, 7, 13, 18], [2, 8, 14, 19]]
  diagolan_array_right_to_left = [[4, 8, 12, 16], [5, 9, 13, 17]]
  push_to_winning_lines_multiple_times(diagolan_array_left_to_right, 2, '5x5', 5)
  push_to_winning_lines_multiple_times(diagolan_array_right_to_left, 2, '5x5', 5)
end

def winning_rows_for_9x9
  rows_array = [[1, 2, 3, 4], [2, 3, 4, 5], [3, 4, 5, 6], [4, 5, 6, 7], [5, 6, 7, 8], [6, 7, 8, 9]]
  push_to_winning_lines_multiple_times(rows_array, 9, '9x9', 9)
end

def winning_columns_for_9x9
  columns_array = [[1, 10, 19, 28], [2, 11, 20, 29], [3, 12, 21, 30], [4, 13, 22, 31], [5, 14, 23, 32], [6, 15, 24, 33], [7, 16, 25, 34], [8, 17, 26, 35], [9, 18, 27, 36]]
  push_to_winning_lines_multiple_times(columns_array, 6, '9x9', 9)
end

def winning_diagonals_for_9x9
  diagolan_array_left_to_right = [[1, 11, 21, 31], [2, 12, 22, 32], [3, 13, 23, 33], [4, 14, 24, 34], [5, 15, 25, 35], [6, 16, 26, 36]]
  diagolan_array_right_to_left = [[4, 12, 20, 28], [5, 13, 21, 29], [6, 14, 22, 30], [7, 15, 23, 31], [8, 16, 24, 32], [9, 17, 25, 33]]
  push_to_winning_lines_multiple_times(diagolan_array_left_to_right, 6, '9x9', 9)
  push_to_winning_lines_multiple_times(diagolan_array_right_to_left, 6, '9x9', 9)
end

def initialize_winning_lines_for_3x3
  winning_rows_for_3x3
  winning_columns_for_3x3
  winning_diagonals_for_3x3
end

def initialize_winning_lines_for_5x5
  winning_rows_for_5x5
  winning_columns_for_5x5
  winning_diagonals_for_5x5
end

def initialize_winning_lines_for_9x9
  winning_rows_for_9x9
  winning_columns_for_9x9
  winning_diagonals_for_9x9
end

#----------------------------------GENERAL FUNCTIONALITY-----------------------------------

def prompt(msg)
  puts "=> #{msg}"
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

def rjust (marker)
  marker.to_s.rjust(2, " ")
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

#--------------------------------WELCOMING DISPLAY--------------------------------

# rubocop:disable Metrics/AbcSize
def welcome
  puts '+' + ('-' * 13) + '+'
  puts '|' + (' ' * 13) + '|'
  puts '|' + " WELCOME!! ".center(13) + '|'
  puts '|' + (' ' * 13) + '|'
  puts '+' + ('-' * 13) + '+'
end
# rubocop:enable Metrics/AbcSize

#------------------------------REQUEST INPUT----------------------------------------

def ready_for_next_game?
  loop do 
    prompt "Press ENTER when ready to continue."
    ready = gets
    break 
  end
end

def get_board_dimensions
  board_dimensions =nil
  loop do
    system 'clear'
    prompt "Would you like to play on a 3x3, 5x5 or 9x9 game board?"  
    prompt "Please select one:"
    prompt "1: 3x3 board"
    prompt "2: 5x5 board"
    prompt "3: 9x9 board"
    board_dimensions = gets.chomp.to_i
    break if [1, 2, 3].include?(board_dimensions)
    prompt "Invalid option. Please select again."
    sleep(1.2)
    system 'clear'
  end
  case board_dimensions
  when 1
    '3x3'
  when 2
    '5x5'
  when 3
    '9x9'
  end
end

def board_range (current_dimensions)
  case current_dimensions
  when '3x3'
    (1..9)
  when '5x5'
    (1..25)
  when '9x9'
    (1..81)
  end
end

def who_goes_first_if_alternating
  second_answer = nil
  loop do
    prompt "Who would you like to go first?"
    prompt "Please select one:"
    prompt "1: #{PLAYER_OPTIONS[1]}"
    prompt "2: #{PLAYER_OPTIONS[2]}"
    second_answer = gets.chomp.to_i
    break if second_answer == 1 || second_answer == 2
    prompt "Invalid option. Please select again."
    sleep(1.2)
    system 'clear'
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
    prompt "Invalid option. Please select again."
    sleep(1.2)
    system 'clear'
  end
  answer
end

#---------------------------------------DISPLAY ON SCREEN-----------------------------------

def display_board(brd, current_dimensions)
  case current_dimensions
  when '3x3'  
    display_board_3x3(brd)
  when '5x5'
    display_board_5x5(brd)
  when '9x9'
    display_board_9x9(brd)
  end
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize

def display_board_3x3(brd)
  prompt "First player to win #{MATCH_LENGTH} games wins the match."
  prompt "You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
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

def display_board_5x5(brd)
  prompt "First player to win #{MATCH_LENGTH} games wins the match."
  prompt "You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  puts ""
  puts "      |      |      |      |" 
  puts "  #{rjust(brd[1])}  |  #{rjust(brd[2])}  |  #{rjust(brd[3])}  |  #{rjust(brd[4])}  |  #{rjust(brd[5])}"
  puts "      |      |      |      |" 
  puts "------+------+------+------+------"
  puts "      |      |      |      |" 
  puts "  #{rjust(brd[6])}  |  #{rjust(brd[7])}  |  #{rjust(brd[8])}  |  #{rjust(brd[9])}  |  #{(brd[10])}"
  puts "      |      |      |      |" 
  puts "------+------+------+------+------"
  puts "      |      |      |      |" 
  puts "  #{(brd[11])}  |  #{(brd[12])}  |  #{(brd[13])}  |  #{(brd[14])}  |  #{(brd[15])}"
  puts "      |      |      |      |" 
  puts "------+------+------+------+------"
  puts "      |      |      |      |" 
  puts "  #{(brd[16])}  |  #{(brd[17])}  |  #{(brd[18])}  |  #{(brd[19])}  |  #{(brd[20])}"
  puts "      |      |      |      |" 
  puts "------+------+------+------+------"
  puts "      |      |      |      |" 
  puts "  #{(brd[21])}  |  #{(brd[22])}  |  #{(brd[23])}  |  #{(brd[24])}  |  #{(brd[25])}"
  puts "      |      |      |      |" 
  puts ""
end

def display_board_9x9(brd) 
  puts "First player to win #{MATCH_LENGTH} games wins the match."
  puts "You're #{PLAYER_MARKER}, computer is #{COMPUTER_MARKER}"
  puts ""
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{rjust(brd[1])}  |  #{rjust(brd[2])}  |  #{rjust(brd[3])}  |  #{rjust(brd[4])}  |  #{rjust(brd[5])}  |  #{rjust(brd[6])}  |  #{rjust(brd[7])}  |  #{rjust(brd[8])}  |  #{rjust(brd[9])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[10])}  |  #{(brd[11])}  |  #{(brd[12])}  |  #{(brd[13])}  |  #{(brd[14])}  |  #{(brd[15])}  |  #{(brd[16])}  |  #{(brd[17])}  |  #{(brd[18])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[19])}  |  #{(brd[20])}  |  #{(brd[21])}  |  #{(brd[22])}  |  #{(brd[23])}  |  #{(brd[24])}  |  #{(brd[25])}  |  #{(brd[26])}  |  #{(brd[27])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[28])}  |  #{(brd[29])}  |  #{(brd[30])}  |  #{(brd[31])}  |  #{(brd[32])}  |  #{(brd[33])}  |  #{(brd[34])}  |  #{(brd[35])}  |  #{(brd[36])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[37])}  |  #{(brd[38])}  |  #{(brd[39])}  |  #{(brd[40])}  |  #{(brd[41])}  |  #{(brd[42])}  |  #{(brd[43])}  |  #{(brd[44])}  |  #{(brd[45])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[46])}  |  #{(brd[47])}  |  #{(brd[48])}  |  #{(brd[49])}  |  #{(brd[50])}  |  #{(brd[51])}  |  #{(brd[52])}  |  #{(brd[53])}  |  #{(brd[54])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[55])}  |  #{(brd[56])}  |  #{(brd[57])}  |  #{(brd[58])}  |  #{(brd[59])}  |  #{(brd[60])}  |  #{(brd[61])}  |  #{(brd[62])}  |  #{(brd[63])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[64])}  |  #{(brd[65])}  |  #{(brd[66])}  |  #{(brd[67])}  |  #{(brd[68])}  |  #{(brd[69])}  |  #{(brd[70])}  |  #{(brd[71])}  |  #{(brd[72])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts "------+------+------+------+------+------+------+------+------"
  puts "      |      |      |      |      |      |      |      |" 
  puts "  #{(brd[73])}  |  #{(brd[74])}  |  #{(brd[75])}  |  #{(brd[76])}  |  #{(brd[77])}  |  #{(brd[78])}  |  #{(brd[79])}  |  #{(brd[80])}  |  #{(brd[81])}"
  puts "      |      |      |      |      |      |      |      |" 
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def display_score
  # prompt "Match Length : #{MATCH_LENGTH}"
  prompt "Current Score"
  prompt "Player: #{SCORE['player']}"
  prompt "Computer: #{SCORE['computer']}"
  prompt "Ties: #{SCORE['tie']}."
end

def display_winning_conditions(current_dimensions)
  case current_dimensions
  when "3x3"
    system 'clear'
    prompt "---------First to get 3 in a row wins!!----------"
  when '5x5'
    system 'clear'
    prompt "---------First to get 4 in a row wins!!----------"
  when '9x9'
    system 'clear'
    prompt "---------First to get 4 in a row wins!!---------"
  end
end

def display_winner(board, current_dimensions)
  if someone_won?(board, current_dimensions)
    prompt "#{detect_winner(board, current_dimensions)} wins!"
  else
    prompt "It's a tie!"
  end
end

def display_comp_move(move)
  prompt "Computer chose #{move}."
  sleep(1.2)
end

def who_won_the_match
  prompt "#{(SCORE.key(MATCH_LENGTH)).capitalize} won the match!!"
end

#--------------------------------------WINNING CONDITIONALS----------------------------------

# rubocop:disable Layout/LineLength
def detect_winner(brd, current_dimensions)
  
  WINNING_LINES[current_dimensions].each do |line|
    case current_dimensions
    when '3x3'
      if brd.values_at(*line).select { |value| value == PLAYER_MARKER }.size == 3
        return 'Player'
      elsif brd.values_at(*line).select { |value| value == COMPUTER_MARKER }.size == 3
        return 'Computer'
      end
    when '5x5'
      if brd.values_at(*line).select { |value| value == PLAYER_MARKER }.size == 4
        return 'Player'
      elsif brd.values_at(*line).select { |value| value == COMPUTER_MARKER }.size == 4
        return 'Computer'
      end
    when '9x9'
      if brd.values_at(*line).select { |value| value == PLAYER_MARKER }.size == 4
        return 'Player'
      elsif brd.values_at(*line).select { |value| value == COMPUTER_MARKER }.size == 4
        return 'Computer'
      end
    end
  end
  nil
end
# rubocop:enable Layout/LineLength

def board_full?(brd)
  available_empty_squares(brd).empty?
end

def someone_won?(brd, current_dimensions)
  !!detect_winner(brd, current_dimensions)
end

#----------------------------------TURN ORDER LOGIC----------------------------------

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

#-----------------------------------PIECE PLACEMENT LOGIC------------------------------------

def available_empty_squares(brd)
  brd.keys.select { |num| brd[num] == num }
end

def opposite_marker(marker)
  return COMPUTER_MARKER if marker == PLAYER_MARKER
  PLAYER_MARKER
end

def optimal_move?(brd, sub_array, key, marker)
  sub_array.include?(key) && brd[key].class == Integer
end

# rubocop:disable Layout/LineLength
def find_empty_square(brd, sub_array, marker)
  brd.select { |key, _| optimal_move?(brd, sub_array, key, marker)}
end

#           -------------------  For Computer Placement -----------------

def offence_defence(brd, marker, current_dimensions)
  placement = nil
  if current_dimensions == "3x3"
    WINNING_LINES[current_dimensions].each do |sub_array|
      if brd.values_at(*sub_array).count(marker) == 2 && find_empty_square(brd, sub_array, marker)
        placement = find_empty_square(brd, sub_array, marker).keys.first
      end
    end
  elsif current_dimensions == "5x5" || current_dimensions == "9x9"
    WINNING_LINES[current_dimensions].each do |sub_array|
      if brd.values_at(*sub_array).count(marker) == 3 && find_empty_square(brd, sub_array, marker).size == 1
        placement = find_empty_square(brd, sub_array, marker).keys.first
      elsif brd.values_at(*sub_array).count(marker) == 2 && find_empty_square(brd, sub_array, marker).size == 2
        placement = find_empty_square(brd, sub_array, marker).keys.first
      # elsif brd.values_at(*sub_array).count(marker) == 1 && find_empty_square(brd, sub_array, marker).size == 2
      #   placement = find_empty_square(brd, sub_array, marker).keys.first
      end
    end
  end
  placement
end
# rubocop:enable Layout/LineLength

def computer_places_piece!(brd, current_dimensions)
  square = offence_defence(brd, COMPUTER_MARKER, current_dimensions)
  if square.nil?
    square = offence_defence(brd, PLAYER_MARKER, current_dimensions)
  end
  case current_dimensions
  when "3x3"
    if square.nil? && brd[5] == 5
      square = 5
    elsif square.nil?
      square = available_empty_squares(brd).sample
    end
  when "5x5"
    if square.nil? && brd[13] == 13
      square = 13
    elsif square.nil?
      square = available_empty_squares(brd).sample
    end
  when "9x9"
    if square.nil? && brd[41] == 41
      square = 41
    elsif square.nil?
      square = available_empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
  display_comp_move(square)
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Your turn. Please choose a square:"
    # prompt "(#{joinor(available_empty_squares(brd))})" # no longer necessary because available numbers are visible on board
    square = gets.chomp.to_i
    break if available_empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

#-----------------------------------PIECE PLACEMENT EXECUTION-------------------------------

def place_piece!(board, current_player, current_dimensions)
  if current_player == "player"
    player_places_piece!(board)
  else
    computer_places_piece!(board, current_dimensions)
  end
end


#-------------------------------LOOPING ONE GAME OF MATCH--------------------------------

def one_game(board, starting_player, current_dimensions)
  system 'clear'
  puts "#{starting_player.capitalize} goes first!"
  sleep(1.7)
  current_player = starting_player
  loop do
    display_winning_conditions(current_dimensions)
    display_score
    display_board(board, current_dimensions)
    place_piece!(board, current_player, current_dimensions)
    current_player = alternate_player(current_player)
    break if someone_won?(board, current_dimensions) || board_full?(board)
  end
  display_winning_conditions(current_dimensions)
  display_score
  display_board(board, current_dimensions)
end

def start_one_game(board, starting_player, current_dimensions)
  one_game(board, starting_player, current_dimensions)
  update_score(detect_winner(board, current_dimensions))
  display_winner(board, current_dimensions)
  display_score
  ready_for_next_game?
end

#------------------------------------INITIAL GREETING---------------------------------

system "clear"
welcome
sleep(1.6)

#------------------------------------MATCH LOOP BEGINS---------------------------------

loop do
  current_dimensions = get_board_dimensions
  board = initialize_board(board_range(current_dimensions), current_dimensions)
  initialize_winning_lines(current_dimensions)
  system 'clear'
  who_goes_first = deciding_start(decide_turn_order)
  sleep(0.3)
  starting_player = who_goes_first

  loop do
    if who_goes_first == 'random'
      starting_player = PLAYER_OPTIONS[rand(1..2)]
    end
    start_one_game(board, starting_player, current_dimensions)
    board = initialize_board(board_range(current_dimensions), current_dimensions)
    break if SCORE.values_at('player', 'computer').include?(MATCH_LENGTH)
    starting_player = alternate_player(starting_player)
  end

  who_won_the_match
  prompt "Play again? (Y or N)"
  answer = gets.chomp.downcase
  break unless answer == "y"
  reset_score
end

#-------------------------------MATCH LOOP ENDS------------------------------------

system "clear"
prompt "Thanks for playing!!"
prompt ""
