
class String
  # String colorization that I found on Stackoverflow
  # that makes the game much more visually appealing.
  # Sorry, I did cheat and copy & paste this code.
  # I do somewhat understand the concept of classes and 'self',
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
MARKERS = {
  "player1" => 'X'.rjust(2, " ").red,
  "player2" => 'S'.rjust(2, " ").green,
  "player3" => 'R'.rjust(2, " ").pink,
  "player4" => 'Y'.rjust(2, " ").gray,
  "computer1" => 'O'.rjust(2, " ").blue,
  "computer2" => 'A'.rjust(2, " ").yellow,
  "computer3" => 'K'.rjust(2, " ").light_blue
}
MATCH_LENGTH = 3
TURN_ORDER = {
  1 => 'alternating',
  2 => 'random'
}

#------------------------------INITIALIZE BOARD--------------------------------

def initialize_brd(range)
  range.each_with_object({}) { |num, hsh| hsh[num] = num }
end

#---------------------------INITIALIZE score BOARD----------------------------

def init_score_brd(players, score)
  players.each { |player| score[player] = 0 }
  score['tie'] = 0
end

#------------------------INITIALIZE WINNING CONDITIONS------------------------

# rubocop:disable Layout/LineLength

def initialize_winning_lines(current_dimensions)
  case current_dimensions
  when '3x3' then initialize_winning_lines_for_3x3
  when '5x5' then initialize_winning_lines_for_5x5
  when '9x9' then initialize_winning_lines_for_9x9
  end
end

def push_to_winning_lines_multiple_times(base_array, number_of, key, increment_value)
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
  rows_array = [[1, 2, 3, 4], [2, 3, 4, 5]]
  push_to_winning_lines_multiple_times(rows_array, 5, '5x5', 5)
end

def winning_columns_for_5x5
  columns_array = [[1, 6, 11, 16], [2, 7, 12, 17], [3, 8, 13, 18], [4, 9, 14, 19], [5, 10, 15, 20]]
  push_to_winning_lines_multiple_times(columns_array, 2, '5x5', 5)
end

def winning_diagonals_for_5x5
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

# rubocop:enable Layout/LineLength

#----------------------------GENERAL FUNCTIONALITY----------------------------

def prompt(msg)
  puts "=> #{msg}"
end

# method below not needed but part of the additional features assignment

# def join_or(arr, punc = ',', last_punc = "or")
#   array_with_punctuation = arr.map do |num|
#     if arr[0] == num
#       num.to_s
#     elsif arr[-1] == num
#       num.to_s.prepend(" #{last_punc} ")
#     else num.to_s.prepend("#{punc} ")
#     end
#   end
#   array_with_punctuation.join('')
# end

def rjust(marker)
  marker.to_s.rjust(2, " ")
end

def update_score!(scorer, score)
  if scorer
    score[scorer.downcase] += 1
  else
    score['tie'] += 1
  end
end

def reset_score(score)
  score.each_key { |k| score[k] = 0 }
end

def max_is(current_dimensions)
  case current_dimensions
  when '3x3' then 2
  when '5x5' then 3
  when '9x9' then 4
  end
end

def brd_dimensions_string(brd_dimensions)
  case brd_dimensions
  when 1 then '3x3'
  when 2 then '5x5'
  when 3 then '9x9'
  end
end

#--------------------------WELCOMING DISPLAY-------------------------

# rubocop:disable Metrics/AbcSize
def welcome
  puts '+' + ('-' * 13) + '+'
  puts '|' + (' ' * 13) + '|'
  puts '|' + " WELCOME!! ".center(13) + '|'
  puts '|' + (' ' * 13) + '|'
  puts '+' + ('-' * 13) + '+'
end
# rubocop:enable Metrics/AbcSize

#------------------------ USER INPUT ---------------------------------

def request_brd_dimensions
  brd_dimensions = nil
  loop do
    system 'clear'
    prompt "Would you like to play on a 3x3, 5x5 or 9x9 game board?"
    prompt "Please select one:"
    prompt "1: 3x3 board"
    prompt "2: 5x5 board"
    prompt "3: 9x9 board"
    brd_dimensions = gets.chomp.to_i
    break if [1, 2, 3].include?(brd_dimensions)
    prompt "Invalid option. Please select again."
    sleep(1.2)
    system 'clear'
  end
  brd_dimensions_string(brd_dimensions)
end

def brd_range(current_dimensions)
  case current_dimensions
  when '3x3' then (1..9)
  when '5x5' then (1..25)
  when '9x9' then (1..81)
  end
end

def who_goes_first_if_alternating(players_array)
  second_answer = nil
  loop do
    prompt "Who would you like to go first?"
    prompt "Please select one:"
    players_array.each_with_index do |player, index|
      prompt "#{index + 1}: #{player.capitalize}"
    end
    second_answer = gets.chomp.to_i
    break if second_answer <= players_array.size && second_answer > 0
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

def how_many_humans(max, min)
  player_count = nil
  loop do
    prompt "How many human players?"
    player_count = gets.chomp.to_i
    break if player_count <= max && player_count > min
    prompt "Invalid number of players. Please try again."
  end
  player_count
end

def how_many_comps(max, min)
  computer_count = nil
  loop do
    prompt "How many computer opponents?"
    computer_count = gets.chomp.to_i
    break if computer_count <= max && computer_count >= min
    prompt "Invalid number of players. Please try again."
  end
  computer_count
end

def how_many_players(current_dimensions)
  player_count = nil
  computer_count = nil
  max = max_is(current_dimensions)
  min = 0

  loop do
    prompt "Maximum number of players is #{max}."
    player_count = how_many_humans(max, min)
    computer_count = how_many_comps(max, min)
    break if player_count + computer_count <= max
    prompt "Too many players. Maximum total number of players is #{max}"
    sleep(1.5)
  end
  [player_count, computer_count]
end

def player_count_to_array(count_arr)
  players_array = []
  count_arr.each_with_index do |num, index|
    num.times do |i|
      case index
      when 0 then players_array << "player" + (i + 1).to_s
      when 1 then players_array << "computer" + (i + 1).to_s
      end
    end
  end
  players_array
end

def player_chooses_square(brd, current_player)
  square = ''
  loop do
    prompt "#{current_player.capitalize}'s turn. Please choose a square."
    # prompt "(#{join_or(available_empty_squares(brd))})"
    # no longer necessary because available numbers are visible on brd
    square = gets.chomp.to_i
    break if available_empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  square
end

def ready_for_next_game?
  loop do
    prompt "Press ENTER when ready to continue."
    gets
    break
  end
end

#---------------------------------DISPLAY ON SCREEN----------------------------

def display_brd(brd, current_dimensions, players_array)
  case current_dimensions
  when '3x3'
    display_brd_3x3(brd, players_array)
  when '5x5'
    display_brd_5x5(brd, players_array)
  when '9x9'
    display_brd_9x9(brd, players_array)
  end
end

def display_player_markers(players_array)
  prompt_string = MARKERS.each_with_object([]) do |(key, value), array|
    array << "#{key.capitalize} is#{value}" if players_array.include?(key)
  end
  prompt prompt_string.join(' , ')
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Layout/LineLength

def display_brd_3x3(brd, players_array)
  prompt "First player to win #{MATCH_LENGTH} games wins the match."
  display_player_markers(players_array)
  puts ""
  puts "     |     |"
  puts " #{rjust(brd[1])}  | #{rjust(brd[2])}  | #{rjust(brd[3])}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{rjust(brd[4])}  | #{rjust(brd[5])}  | #{rjust(brd[6])}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts " #{rjust(brd[7])}  | #{rjust(brd[8])}  | #{rjust(brd[9])}"
  puts "     |     |"
  puts ""
  puts ""
end

def display_brd_5x5(brd, players_array)
  prompt "First player to win #{MATCH_LENGTH} games wins the match."
  display_player_markers(players_array)
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

def display_brd_9x9(brd, players_array)
  prompt "First player to win #{MATCH_LENGTH} games wins the match."
  display_player_markers(players_array)
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

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Layout/LineLength

def display_score(score)
  players = score.keys
  scores = score.values
  prompt "Current Score"
  players.each_with_index do |player, i|
    prompt "#{player.capitalize}: #{scores[i]}"
  end
end

def display_winning_conditions(current_dimensions)
  system 'clear'
  if current_dimensions == "3x3"
    prompt "---------First to get 3 in a row wins!!----------"
  else
    prompt "---------First to get 4 in a row wins!!----------"
  end
end

# rubocop:disable Layout/LineLength

def display_winner(brd, current_dimensions, players_array)
  if someone_won?(brd, current_dimensions, players_array)
    prompt "#{detect_winner(brd, current_dimensions, players_array).capitalize} wins!"
  else
    prompt "It's a tie!"
  end
end

# rubocop:enable Layout/LineLength

def display_comp_move(move)
  prompt "Computer chose #{move}."
  sleep(1.5)
end

def who_won_the_match(score)
  prompt "#{(score.key(MATCH_LENGTH)).capitalize} won the match!!"
end

#--------------------------------WINNING CONDITIONALS---------------------------

# rubocop:disable Layout/LineLength, Metrics/CyclomaticComplexity

def detect_winner(brd, current_dimensions, players_array)
  winner = nil
  players_array.each do |player|
    WINNING_LINES[current_dimensions].each do |line|
      if current_dimensions == '3x3'
        winner = player if brd.values_at(*line).select { |value| value == MARKERS[player] }.size == 3
      elsif brd.values_at(*line).select { |value| value == MARKERS[player] }.size == 4
        winner = player
      end
    end
  end
  winner
end

# rubocop:enable Layout/LineLength, Metrics/CyclomaticComplexity

def brd_full?(brd)
  available_empty_squares(brd).empty?
end

def someone_won?(brd, current_dimensions, players_array)
  !!detect_winner(brd, current_dimensions, players_array)
end

#----------------------------TURN ORDER LOGIC---------------------------

# rubocop:disable Layout/LineLength

def deciding_start(answer, players_array)
  return players_array[who_goes_first_if_alternating(players_array) - 1] if answer == 1
  TURN_ORDER[2]
end

# rubocop:enable Layout/LineLength

def next_player(players_array, current_player)
  next_player_index = players_array.index(current_player) + 1
  next_player_index = 0 if next_player_index >= players_array.size
  players_array[next_player_index]
end

#-----------------------------PIECE PLACEMENT LOGIC-----------------------------

def available_empty_squares(brd)
  brd.keys.select { |num| brd[num] == num }
end

def optimal_move?(brd, sub_array, key)
  sub_array.include?(key) && brd[key].class == Integer
end

def find_empty_square(brd, sub_array)
  brd.select { |key, _| optimal_move?(brd, sub_array, key) }
end

#         ---------------  For Computer Placement -----------------

# rubocop:disable Layout/LineLength

def loop_though_winning_lines_3x3(brd, marker, current_dimensions)
  placement = nil
  WINNING_LINES[current_dimensions].each do |sub_array|
    if brd.values_at(*sub_array).count(marker) == 2 &&
      find_empty_square(brd, sub_array).size == 1
      placement = find_empty_square(brd, sub_array).keys.first
    end
  end
  placement
end

def search_winning5x5_9x9lines_for_3in_a_row(brd, marker, current_dimensions)
  placement = nil
  WINNING_LINES[current_dimensions].each do |sub_array|
    if brd.values_at(*sub_array).count(marker) == 3 &&
      find_empty_square(brd, sub_array).size == 1
      placement = find_empty_square(brd, sub_array).keys.first
    end
  end
  placement
end

def search_winning5x5_9x9lines_for_2in_a_row(brd, marker, current_dimensions)
  placement = nil
  WINNING_LINES[current_dimensions].each do |sub_array|
    if brd.values_at(*sub_array).count(marker) == 2 &&
      find_empty_square(brd, sub_array).size == 2
      placement = find_empty_square(brd, sub_array).keys.first
    end
  end
  placement
end

def move_3x3(brd, marker, current_dimensions, square = nil)
  if square.nil?
    square = loop_though_winning_lines_3x3(brd, marker, current_dimensions)
  end
  square
end

def winning_move(brd, current_dimensions, current_player)
  search_winning5x5_9x9lines_for_3in_a_row(brd, MARKERS[current_player], current_dimensions)
end

def setup_winning_condition_move(brd, current_dimensions, current_player, square)
  if square.nil? # should be nil if nothing assigned to square yet
    square = search_winning5x5_9x9lines_for_2in_a_row(brd, MARKERS[current_player], current_dimensions)
  end
  square
end

def prevent_winning_move(brd, current_dimensions, players_array, square)
  if square.nil? # should be nil if nothing assigned to square yet
    array_of_options = players_array.map do |player|
      search_winning5x5_9x9lines_for_3in_a_row(brd, MARKERS[player], current_dimensions)
    end
    return array_of_options.filter { |option| !option.nil? }.sample
  end
  square
end

def prevent_winning_setup_move(brd, current_dimensions, players_array, square)
  if square.nil? # should be nil if nothing assigned to square yet
    array_of_options = players_array.map do |player|
      search_winning5x5_9x9lines_for_2in_a_row(brd, MARKERS[player], current_dimensions)
    end
    return array_of_options.filter { |option| !option.nil? }.sample
  end
  square
end

# rubocop:enable Layout/LineLength

# rubocop:disable Metrics/CyclomaticComplexity

def place_center_of_brd(brd, current_dimensions, square)
  if square.nil?
    case current_dimensions
    when '3x3' then square = 5 if brd[5] == 5
    when '5x5' then square = 14 if brd[14] == 14
    when '9x9' then square = 41 if brd[41] == 41
    end
  end
  square
end

# rubocop:enable Metrics/CyclomaticComplexity

# rubocop:disable Layout/LineLength, Metrics/AbcSize

def place_close_to_self(brd, marker, current_dimensions, square)
  if square.nil? # should be nil if nothing assigned to square
    WINNING_LINES[current_dimensions].shuffle.each do |sub_array|
      if brd.values_at(*sub_array).count(marker) == 1 &&
        find_empty_square(brd, sub_array).size == 3
        square = find_empty_square(brd, sub_array).keys.sample
      end
    end
  end
  square
end

def place_close_to_player(brd, current_dimensions, players_array, square)
  if square.nil? # should be nil if nothing assigned to square yet
    array_of_options = []
    players_array.map do |player|
      WINNING_LINES[current_dimensions].shuffle.each do |sub_array|
        if brd.values_at(*sub_array).count(MARKERS[player]) == 1 &&
          find_empty_square(brd, sub_array).size == 3
          array_of_options << find_empty_square(brd, sub_array).keys
        end
      end
    end
    square = array_of_options.filter { |option| !option.nil? }.flatten.sample
  end
  square
end

def place_in_empty_square(brd, square)
  if square.nil?
    square = brd.select { |_, value| value.class == Integer }.keys.sample
  end
  square
end

# rubocop:enable Layout/LineLength

# rubocop:disable Layout/LineLength

def comp_3x3_move(brd, current_dimensions, current_player, players_array)
  square = move_3x3(brd, MARKERS[current_player], current_dimensions, square) # offence
  square = move_3x3(brd, MARKERS[next_player(players_array, current_player)], current_dimensions, square) # defence
  square = place_center_of_brd(brd, current_dimensions, square)
  square = place_in_empty_square(brd, square)
  square
end

def comp_5x5_and_9x9_move(brd, current_dimensions, current_player, players_array)
  square = winning_move(brd, current_dimensions, current_player)
  square = prevent_winning_move(brd, current_dimensions, players_array, square)
  square = setup_winning_condition_move(brd, current_dimensions, current_player, square)
  square = prevent_winning_setup_move(brd, current_dimensions, players_array, square)
  square = place_close_to_self(brd, MARKERS[current_player], current_dimensions, square)
  square = place_close_to_player(brd, current_dimensions, players_array, square)
  square = place_in_empty_square(brd, square)
  square
end

def computer_places_piece!(brd, current_dimensions, current_player, players_array)
  if current_dimensions == '3x3'
    square = comp_3x3_move(brd, current_dimensions, current_player, players_array)
  else
    square = comp_5x5_and_9x9_move(brd, current_dimensions, current_player, players_array)
  end
  brd[square] = MARKERS[current_player]
  display_comp_move(square)
end

# rubocop:enable Layout/LineLength, Metrics/AbcSize

#           -----------------  For Player Placement  ----------------------

def player_places_piece!(brd, current_player)
  brd[player_chooses_square(brd, current_player)] = MARKERS[current_player]
end

#-----------------------------PIECE PLACEMENT EXECUTION------------------------

# rubocop:disable Layout/LineLength

def place_piece!(brd, current_player, current_dimensions, players_array)
  if current_player.include?("player")
    player_places_piece!(brd, current_player)
  else
    computer_places_piece!(brd, current_dimensions, current_player, players_array)
  end
end

#-------------------------LOOPING ONE GAME OF MATCH-------------------------

def one_game(brd, start_player, current_dimensions, score, players_array)
  system 'clear'
  puts "#{start_player.capitalize} goes first!"
  sleep(1.7)
  current_player = start_player
  each_players_turn(brd, current_player, current_dimensions, score, players_array)
  after_each_game(brd, current_dimensions, score, players_array)
end

def each_players_turn(brd, current_player, current_dimensions, score, players_array)
  loop do
    display_winning_conditions(current_dimensions)
    display_score(score)
    display_brd(brd, current_dimensions, players_array)
    place_piece!(brd, current_player, current_dimensions, players_array)
    current_player = next_player(players_array, current_player)
    break if someone_won?(brd, current_dimensions, players_array) || brd_full?(brd)
  end
end

# rubocop:enable Layout/LineLength

def after_each_game(brd, current_dimensions, score, players_array)
  display_winning_conditions(current_dimensions)
  display_score(score)
  display_brd(brd, current_dimensions, players_array)
  update_score!(detect_winner(brd, current_dimensions, players_array), score)
  display_winner(brd, current_dimensions, players_array)
end

def start_one_game(brd, start_player, current_dimensions, score, players_array)
  one_game(brd, start_player, current_dimensions, score, players_array)
  display_score(score)
  ready_for_next_game?
end

#------------------------------INITIAL GREETING--------------------------

system "clear"
welcome
sleep(1.6)

#------------------------------MATCH LOOP BEGINS--------------------------

loop do
  score = {}

  current_dimensions = request_brd_dimensions
  brd = initialize_brd(brd_range(current_dimensions))
  initialize_winning_lines(current_dimensions)
  players_array = player_count_to_array(how_many_players(current_dimensions))
  init_score_brd(players_array, score)
  system 'clear'
  who_goes_first = deciding_start(decide_turn_order, players_array)
  start_player = who_goes_first
  sleep(0.3)

  loop do
    if start_player == 'random'
      start_player = players_array.sample
    end
    start_one_game(brd, start_player, current_dimensions, score, players_array)
    brd = initialize_brd(brd_range(current_dimensions))
    break if score.values_at(*players_array).include?(MATCH_LENGTH)
    start_player = next_player(players_array, start_player)
  end

  who_won_the_match(score)
  prompt "Play again? (Y or N)"
  answer = gets.chomp.downcase[0]
  break unless answer == "y"
  reset_score(score)
end

#-------------------------MATCH LOOP ENDS-----------------------------

system "clear"
prompt ""
prompt "Thanks for playing. Come back soon! 😄"
prompt "👋👋"
