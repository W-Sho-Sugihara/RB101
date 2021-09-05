MAX = 21
DEALER_MIN = 17
ACE_LOWER = 1
ACE_UPPER = 11
HAND_SIZE = 2

# -------------------------INITIALIZE DECK-----------------------

def init_deck
  init_array = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  init_array.each_with_object([]) do |card, array|
    %w(♥︎ ♦︎ ♠︎ ♣︎).each do |suit|
      array << suit + card.to_s
    end
  end
end

#------------------INITIALIZE STARTING HAND----------------------

def init_hands(game_data)
  reshuffle(game_data)
  HAND_SIZE.times { |_| game_data['player_hand'] << game_data['deck'].shift }
  reshuffle(game_data)
  HAND_SIZE.times { |_| game_data['dealer_hand'] << game_data['deck'].shift }
  reshuffle(game_data)
end

#----------------------GENERAL FUNCTIONALITY------------------

def prompt(msg)
  puts "=> #{msg}"
end

def bust?(player_total)
  player_total > MAX
end

def reshuffle(game_data)
  if game_data['deck'].size <= 1
    game_data['deck'] = init_deck.shuffle
    puts 'RESHUFFLING'
    sleep(2)
  end
end

def clear_hands(game_data)
  game_data['player_hand'].clear
  game_data['dealer_hand'].clear
end

#--------------------DISPLAY HANDS----------------------------

# rubocop:disable Metrics/AbcSize, Lint/UselessAssignment

def create_player_cards(hand)
  cards = <<~CRD
    #{'+-------+' * hand.size}
    #{hand.each_with_object('') do |card, string|
        string << ('| ' + card[0] + '     |') 
      end }
    #{'|       |' * hand.size}
    #{hand.each_with_object('') do |card, string|
        string << ('| ' + card.gsub(/[♥︎♦︎♠︎♣︎]/, '').center(5) + ' |')
      end }
    #{'|       |' * hand.size}
    #{hand.each_with_object('') do |card, string|
        string << ('|     ' + card[0] + ' |') 
      end }
    #{'+-------+' * hand.size}
  CRD
end

def create_dealer_cards(hand)
  cards = <<~CRD
    #{'+-----' * (hand.size - 1)}+-------+
    #{'|     ' * (hand.size - 1)}| #{hand[0][0]}     |
    #{'|     ' * (hand.size - 1)}|       |
    #{'|     ' * (hand.size - 1)}| #{hand[0].gsub(/[♥︎♦︎♠︎♣︎]/, '').center(5)} |
    #{'|     ' * (hand.size - 1)}|       |
    #{'|     ' * (hand.size - 1)}|     #{hand[0][0]} |
    #{'+-----' * (hand.size - 1)}+-------+
  CRD
end

# rubocop:enable Metrics/AbcSize, Lint/UselessAssignment

#--------------------WELCOME DISPLAY-----------------------------

welcome = <<~WEL
  +#{('-' * 30)}+
  |#{(' ' * 30)}|
  |#{"WELCOME to #{MAX}!!".center(30)}|
  |#{(' ' * 30)}|
  +#{('-' * 30)}+
WEL

rules = <<~RLS
RULES

The goal of Twenty-One is to try to get
as close to 21 as possible, without going over.

Using a standard deck of cardS (no Joker),
the player and dealer are both initially dealt 2 cards.
The Dealer will have one card face up.

The value of each card is as follows:
Ace = 1 or 11
King, Queen & Jack = 10
Numbers = the number displayed on itself

On the Players turn she/he can choose to either HIT or STAY.
If HIT is chosen, a card from the top of the deck is added
to the players hand and card value is totaled.
If you go over 21, it's a "bust" and you lose.
The Player may choose to HIT as many consecutive times
as she/he wishes to. 
If STAY is chosen no cards are added and Dealer goes next. 
The Dealer will hit until his total card value is #{DEALER_MIN} or greater. 
If the dealer gose over 21, it's a bust and the dealer loses. 
If neither player busts, then the dealers hand is revealed 
and who ever has a hand value closer to #{MAX} wins.

Ready to Play?
Press ENTER when ready to continue.
RLS

#-----------------GOODBYE DISPLAY------------------------

def goodbye
  system 'clear'
  puts ''
  puts 'Thank you for playing!! See you next time. 👋 '
  sleep(2)
  system 'clear'
end

#-----------------GAME DISPLAY--------------------------------

def display_player_hand(game_data)
  puts ''
  puts create_player_cards(game_data['player_hand'])
  puts "Players Hand"
  puts ''
end

def display_dealer_hand(game_data)
  puts ''
  puts "Dealers Hand"
  puts create_dealer_cards(game_data['dealer_hand'])
  puts ''
end

def display_ending_dealer_hand(game_data)
  puts ''
  puts "Dealers Hand"
  puts create_player_cards(game_data['dealer_hand'])
  puts ''
end

def display_player_hand_total(game_data)
  prompt "Players total is #{game_data['player_total']}."
  puts ''
end

def display_dealer_hand_total(game_data)
  prompt "Dealers total is #{game_data['dealer_total']}."
  puts ''
end

def anyone_bust(game_data)
  if bust?(game_data['player_total'])
    prompt "You BUST! Dealer wins!"
    game_data['dealer_score'] += 1
    true
  elsif bust?(game_data['dealer_total'])
    prompt "Dealer BUST! You win!"
    game_data['player_score'] += 1
    true
  end
end

def no_one_busted(game_data)
  if game_data['player_total'] > game_data['dealer_total']
    prompt "Player Wins!!"
    game_data['player_score'] += 1
  elsif game_data['player_total'] < game_data['dealer_total']
    prompt "Dealer Wins!!"
    game_data['dealer_score'] += 1
  else
    prompt "It's a Tie!!"
  end
end

def display_winner(game_data)
  unless anyone_bust(game_data)
    no_one_busted(game_data)
  end
end

def deck_count(game_data)
  puts "Cards left in deck: #{game_data['deck'].size}"
end

def display_score(game_data)
  puts "Player score: #{game_data['player_score']}" \
       " Dealer score: #{game_data['dealer_score']}"
end

def display_board(game_data)
  system "clear"
  deck_count(game_data)
  display_score(game_data)
  hand_total(game_data)
  display_dealer_hand(game_data)
  display_player_hand(game_data)
  display_player_hand_total(game_data)
end

def display_final_board(game_data)
  system "clear"
  deck_count(game_data)
  display_score(game_data)
  display_ending_dealer_hand(game_data)
  display_player_hand(game_data)
  display_player_hand_total(game_data)
  display_dealer_hand_total(game_data)
end

#------------------HAND TOTAL MECHANICS--------------------------

def convert_face_card_to_num(hand)
  hand.map do |card|
    card = card.gsub(/[♥︎♦︎♠︎♣︎]/, '')
    if card.size > 2
      10
    else card.to_i
    end
  end
end

def hand_contain_ace?(hand)
  hand.map { |card| card.gsub(/[♥︎♦︎♠︎♣︎]/, '') }.include?('Ace')
end

def how_many_aces(hand)
  hand.select do |card|
    card.gsub!(/[♥︎♦︎♠︎♣︎]/, '')
    card == "Ace"
  end
end

def total_for_hands_with_ace(hand)
  other_cards_array, aces_array = hand.partition do |card|
    card.gsub(/[♥︎♦︎♠︎♣︎]/, '') != 'Ace'
  end
  number_of_aces = aces_array.size
  hand_total_before_aces = convert_face_card_to_num(other_cards_array).sum
  sum = hand_total_before_aces + (number_of_aces * 11)
  if sum > 21
    loop do
      sum -= 10
      number_of_aces -= 1
      break if sum <= 21 || number_of_aces == 0
    end
  end
  sum
end

def hand_total(game_data)
  totals = [game_data['player_hand'], game_data['dealer_hand']].map do |hand|
    if hand_contain_ace?(hand)
      total_for_hands_with_ace(hand)
    else
      convert_face_card_to_num(hand).sum
    end
  end
  game_data['player_total'] = totals[0]
  game_data['dealer_total'] = totals[1]
end

#-----------------------DEALER TURN MECHANICS-----------------

def dealer_hits(game_data)
  game_data['dealer_hand'] << game_data['deck'].shift
  prompt "Dealer hits."
  hand_total(game_data)
  sleep(1)
end

def dealer_turn(game_data)
  reshuffle(game_data)
  if game_data['dealer_total'] >= DEALER_MIN
    prompt "Dealer stays."
    sleep(1.3)
  else
    until game_data['dealer_total'] >= DEALER_MIN
      dealer_hits(game_data)
    end
    if game_data['dealer_total'] <= MAX
      prompt "Dealer stays."
      sleep(1.3)
    end
  end
end

#----------------------USER INPUT-------------------------------

def request_hit_or_stay
  answer = ''
  loop do
    prompt "Would you like to HIT or STAY?"
    answer = gets.chomp.downcase[0]
    break if answer == 'h' || answer == 's'
    prompt "Invalid choice. Please try again."
    sleep(1.3)
  end
  answer
end

def play_again?
  answer = ''
  loop do
    puts ''
    prompt "Would you like to play again? (Y/N)"
    answer = gets.chomp.downcase[0]
    break if answer == 'y' || answer == 'n'
    prompt "Invalid answer. Please try again."
    sleep(1.3)
  end
  !(answer == 'y')
end

def hit_or_stay?(game_data)
  reshuffle(game_data)
  answer = ''
  loop do
    display_board(game_data)
    answer = request_hit_or_stay
    if answer == 'h'
      game_data['player_hand'] << game_data['deck'].shift
    elsif answer == 's'
      break
    end
    display_board(game_data)
    break if bust?(game_data['player_total'])
  end
end

#-----------------------GAME PLAY--------------------------------
game_data = {
  'deck' => init_deck.shuffle,
  'player_hand' => [],
  'dealer_hand' => [],
  'player_total' => nil,
  'dealer_total' => nil,
  'player_score' => 0,
  'dealer_score' => 0
}

system 'clear'
puts welcome
sleep(1.3)
puts rules
gets
loop do
  loop do
    init_hands(game_data)
    display_board(game_data)
    hit_or_stay?(game_data)
    if !bust?(game_data['player_total'])
      dealer_turn(game_data)
    end
    break
  end
  display_final_board(game_data)
  display_winner(game_data)
  break if play_again?
  clear_hands(game_data)
  reshuffle(game_data)
end

goodbye
