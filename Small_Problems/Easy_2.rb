##### Q1

# def enter_name (name = "Teddy")
# puts "#{name} is #{rand(20..200)} years old!!"
# end

# enter_name("Sho")

##### Q2

# SQMETERS_TO_SQFEET = 10.7639

# puts "Enter the length of the room in meters:"
# length = gets.chomp.to_f

# puts "Enter the width of the room in meters:"
# width = gets.chomp.to_f

# def return_square (length, width)
#   (length * width).round(2)
# end
# def return_sqr_meters_to_sqr_feet (length_in_meters, width_in_meters)
#  ( (length_in_meters * width_in_meters)*SQMETERS_TO_SQFEET).round(2)
# end
# def convert_feet_to_inch (feet)
#   feet * 12
# end
# def convert_inch_to_cm(inch)
#   inch * 2.2
# end

# puts "The area of the room is #{return_square(length, width)} square meters (#{return_sqr_meters_to_sqr_feet(length, width)} square feet)."

### Further Exploration

# puts "Enter the length of the room in feet:"
# length_in_feet = gets.chomp.to_f

# puts "Enter the width of the room in feet:"
# width_in_feet = gets.chomp.to_f

# length_in_inch = convert_feet_to_inch(length_in_feet)
# width_in_inch = convert_feet_to_inch(width_in_feet)

# length_in_cm = convert_inch_to_cm(length_in_inch)
# width_in_cm = convert_inch_to_cm(width_in_inch)


# puts "The area of the room is #{return_square(length_in_feet, width_in_feet)} square feet" + \
# ", #{return_square(length_in_inch, width_in_inch)} square inch, & #{return_square(length_in_cm,width_in_cm)} square cm."

##### TIP CALCULATOR

# puts "What is the bill?"
# bill = gets.chomp.to_f

# puts "What is the tip percentage?"
# tip_rate = gets.chomp.to_f

# tip = format("%.2f", (bill * (tip_rate /100)).to_s).to_f
# total = format("%.2f", (bill + tip).to_s).to_f

# puts "The tip is #{tip}."
# puts "The total is #{total}."

# puts "The tip is $%.2f." %[tip]
# puts "The total is $%.2f." %[total]

##### WHEN WILL I RETIRE

# puts "What is your age?"
# current_age = gets.chomp.to_i 

# puts "Age what age would you like to retire?"
# retirement_age = gets.chomp.to_i

# years_until_retirement = (retirement_age - current_age)
# current_year = Time.now.year
# year_of_retirement = current_year+ years_until_retirement

# puts "It's #{current_year}. You will retire in #{year_of_retirement}." + \
# " You only have #{years_until_retirement} years until retirement!!"

##### GREETING A USER

# puts "What is your name?"
# user_name = gets.chomp
# if user_name.include?('!')
#   puts "HELLO, #{user_name.upcase} WHY ARE WE SHOUTING?!"
# else puts "Hello, #{user_name}."
# end

## LS answer

# print 'What is your name? '
# name = gets.chomp!

# if name[-1] == '!'
#   name.chop!
#   puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

##### ODD NUMBERS

# (1..99).each { |num| puts num if num.odd?}

###### EVEN NUMBERS

# (1..99).each { |num| puts num if num.even?}

##### SUM OR PRODUCT OF CONSECUTIVE NUMBERS
number = nil
loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.chomp.to_i
  break if number > 0
  puts "Invalid entry. Please try again."
end
compute =''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  compute = gets.chomp
  break if compute =='s' || compute == 'p'
  puts "Invalid entry. Please try again."
end

if compute == "s"
  results = (0..number).sum
  puts "The sum of the integers between 1 and #{number} is #{results}."
else results = (1..number).reduce{ |product, num| product * num}
  puts "The product of the integers between 1 and #{number} is #{results}."
end
