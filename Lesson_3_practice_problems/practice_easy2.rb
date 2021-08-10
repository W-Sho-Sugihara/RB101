##### Q1

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.include?("Spot")
# ages.key?('Spot')
# ages.has_key?("Spot")
# ages.member?("Spot")

##### Q2

# munsters_description = "The Munsters are creepy in a good way."
# p munsters_description.capitalize
# p munsters_description.downcase
# p munsters_description.upcase

## p munsters_description.split(' ').map{ |word| word.split('').map { |letter| letter == letter.upcase ? letter.downcase!: letter.upcase! }.join('')}.join(' ')

# p munsters_description.swapcase

######## Q3

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
# p ages.merge!(additional_ages)

####### Q4

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.include?("Dino")
# p advice.match?("Dino")

####### Q5

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

####### Q6
#flintstones << "Dino"

####### Q7
# p flintstones.push("Dino", "Hoppy")

####### Q8

# advice = "Few things in life are as important as house training your pet dinosaur."
# p advice.slice(0, advice.index('house'))
# p advice.slice!(0...39)

###### Q9

# statement = "The Flintstones Rock!"
# p statement.count('t')

####### Q10

# title = "Flintstone Family Members"
# p title.center(40)
