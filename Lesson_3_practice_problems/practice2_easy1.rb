##### Q3

# advice = "Few things in life are as important as house training your pet dinosaur."

# advice.gsub!('important', 'urgent')

# puts advice

##### Q5

#  puts (1..100).include?(42)

#### Q6

# famous_words = "seven years ago..."
# famous_words = famous_words.split.unshift("Four score and").join(' ')
# puts famous_words

# famous_words = "seven years ago..."
# famous_words.prepend("Four score and ")
# puts famous_words

# famous_words = "seven years ago..."
# "Four score and " + famous_words

##### Q7

# p ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]].flatten!

##### Q8

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.assoc('Barney')
