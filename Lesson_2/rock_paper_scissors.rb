VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  's' => 'scissors',
  'S' => 'Spock',
  'l' => 'lizard'
}
valid_abbreviations= %w(r p s S l)

def print_valid_options(array, hash)
  array.map do |letter|
    "#{letter} for #{hash[letter]}"
  end.join(', ')
end

def prompt(message)
  puts ("=> #{message}")
end

def win? ( player1, player2)
  win_condition = {
    scissors: ['paper', 'lizard'],
    paper: ['rock', 'Spock'],
    rock: ['lizard', 'scissors'],
    lizard: ['Spock', 'paper'],
    Spock: ['scissors', 'rock']
  }
  win_condition[player1.to_sym].include?(player2)
end
# def win? (first, second)
#   (first == 'scissors' && second  == 'paper')||
#   (first == 'paper' &&  second  == 'rock') || 
#   (first =='rock' && second =='lizard') || 
#   (first == 'lizard'&& second == 'Spock')||
#   (first == 'Spock' && second == 'scissors')||
#   (first == 'scissors' && second == 'lizard')||
#   (first == 'lizard' && second == 'paper')||
#   (first == 'paper' && second == 'Spock')||
#   (first == 'Spock' && second == 'rock')||
#   (first == 'rock' && second == 'scissors')
# end

def display_result(player, computer )
  if win?(player, computer)
     "You won!!"
  elsif win?(computer, player)
    "Computer won!"
  else "It's a tie."
  end
end

############## START
loop do

  choice =''

  loop do 
    prompt("Choose one: #{print_valid_options(valid_abbreviations, VALID_CHOICES)}")
    choice_abbreviated= gets.chomp
    

    if valid_abbreviations.include?(choice_abbreviated)
      choice = VALID_CHOICES[choice_abbreviated]
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES[valid_abbreviations.sample]

  prompt("You chose #{choice} and computer chose #{computer_choice}")

  prompt(display_result(choice, computer_choice))

  prompt("Do you want to play again? (Y?)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

end

prompt("Thank you for playing. Goodbye!")