#---------ASCII STRING VALUES----------------------------------------------
#input: string
#output: integer
#Rules: 
  # return the sum of the ascii values of all the letters in given string
  # empty string return 0

# Algorithm
  #split string into individual letters stored in an array
  #convert each letter to its ascii value
  #sum of all the values 
  #return sum

# def ascii_value (string)
  # string.split('').reduce(0) {|sum, letter| sum + letter.ord}
#   string.sum
# end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

#------------After Midnight----------------------------------------------
#input: integer
#output: string('hh:mm')
#Rules:
  #input can be positive or negative
  #return value is in "hh:mm" format
  #cannot use Time or Date classes
  
# Algorithm (positive input)
  #convert input to hours and minutes
    #input/60 for the hours & input%60 for minutes
  #make "hh" the hours and "mm" the minutes

# def positive_time(number)
#   hours, minutes = number.divmod(60)
#   hours = hours/24 if hours >24
#   time = format("%.2d:%.2d", hours, minutes)
# end
# def negative_time(number)
#   hours, minutes = (number.divmod(60))
#   _, hours = (hours.divmod(-24)) if -hours >24
#   hours = 24+hours #if number != 0
#   time = format("%.2d:%.2d", hours, minutes)
# end

# p positive_time(60)
# p positive_time(0)
# p positive_time(35)
# p positive_time(3000)
# p positive_time(800)
 
# p negative_time(-60) == "23:00"
# p negative_time(0) =="00:00"
# p negative_time(-35) =="23:25"
# p negative_time(-3000) =="22:00"
# p negative_time(-800) =="10:40"

# def time_of_day(number)
#   if number >=0
#     positive_time(number)
#   else negative_time(number)
#   end
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

#--------LS answer_______-------

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end

#   minutes % MINUTES_PER_DAY
# end

# p normalize_minutes_to_0_through_1439(-3000)

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# p time_of_day(-3000)

#------------- After Midnight Part 2------------------------------------_---_-----_------_-_--_

#input: time(hh:mm)
#output: integer
#Rules:
  #make two methods, one for minutes before midnight and one for minutes after midnight
  #'00:00' = 0 minutes
  #'24:00' = 0 minutes

#Algorithm
  #method for after midnight
    # store 'hh' multiply by 60 to get hours
    # 'mm' added stored value
  #method for before midnight
    # subtract 'hh' from 24 to get hours before midnight
    # then multiply above value by 60 to get minutes
    # subtract 'mm' from 60 to get minutes before midnight
    # add both values together

# HOURS_PER_DAY = 24
# MINUTES_PER_HOUR = 60

# def after_midnight (time)
#   hour = time[0, 2].to_i
#   return 0 if hour == HOURS_PER_DAY
#   minute = time[-2, 2].to_i
#   hour*MINUTES_PER_HOUR + minute
# end

# # p fter_midnight('12:00')

# def before_midnight(time)
#   return 0 if time == '00:00'
#   hour = 23 - time[0, 2].to_i
#   minute = MINUTES_PER_HOUR - time[-2, 2].to_i
#   hour*MINUTES_PER_HOUR + minute
# end


# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

#------------ Letter Swap-------__---__---__--__--__--___--___--____--__-------___

#input: string
#output: new string
#Rules: 
  #first and last letters in input string are interchanged
  #letter swap each word in given string if more than on word in string
  #if input one letter return letter

# Algorithm
  #split string into individual strings if more than one word
  #on each word interchange first and last letters
  #join together all strings and return as one string

# def letter_swap (string)
#   new_string = string.split(" ")
#   new_string.map do |word| 
#       sub_letter = word[0]
#       word[0] = word[-1]
#       word[-1] = sub_letter
#     end
#  new_string.join(' ')
# end


# p letter_swap('abc abc abc abc abc')
# p letter_swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p letter_swap('Abcde') == 'ebcdA'
# p letter_swap('a') == 'a'


#---------further exploration--------- & LS answer----------------------
# def swap_first_last_characters(a, b)
#   a, b = b, a
# end

# swap_first_last_characters('abc'[0], 'abc'[-1])

# def swap_first_last_characters(word)
#   word[0], word[-1] = word[-1], word[0]
#   word
# end

# def swap(words)
#   result = words.split.map do |word|
#     swap_first_last_characters(word[0], word[-1])
#   end
#   result.join(' ')
# end

# p swap('abc abc')

#--------------Clean up the words----------------------------------____---____________-----__-__-

#input: string
#output: same string updated
#Rules:
  #all non-aphabetical characters to be replaced with spaces
  #if more than one non-alphabetical characters in a sequence, only one space

# Algorithm
  #sub all non-alphabetical characters with white space
  #reduce all multiple white spaces to one space
  
# def cleanup(string)
#   string.gsub(/[^a-z]/, ' ').gsub(/\s+/, ' ' )
# end

# p cleanup('..a..b@@%$^c , ,, d')
# p cleanup("---what's my +*& line?") == ' what s my line '

#---------------Letter Count part 1--------_-_-_-_-_--_-_-_-_-_---_---_-_-_-_----_-_-_-_-_-_---__-

#input: string
#output: hash
#Rules:
  #hash contains only keys corrisponding to letter lengths present in the given string
  #hash values are the count numbers of how many words with the given key length
  #empty input = empty hash
  #word length includes all characters other than white space

#Algorithm
  #split string into array of words
  #iterate over array
    # add to hash new key of word length if not already in hash
    # if key present add to value

# def word_sizes (string)
#   string.split.each_with_object({}){ |word, hash|  hash[word.length] ? hash[word.length] +=1 : hash[word.length] = 1}.sort.to_h
# end

# p word_sizes('Four score and seven.') #== { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') #== { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") #== { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') #== {}


#-----------Letter Count Part 2--------------------------------------------

# def word_sizes (string)
#   string.split.each_with_object({}) do |word, hash| 
#     word = word.gsub(/[^a-zA-Z]/, '') #word.delete('^A-Za-z')
#     hash[word.length] ? hash[word.length] +=1 : hash[word.length] = 1
#   end
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

#------------Alphabetical Numbers-----_____________---___--_________--__--____________--__--____-
#input: array
#output: new array
#Rules:
  # sort numbers in input array alphabetically based on their english name

#Algorithm
  #create a hash with keys 0..19 each with its engligh name as the value
  #iterate through given array of numbers and create a new array with names of numbers using hash keys to extract their names
  #sort new array alphabetically
  #iterate through new array and to create another array of sorted numbers using hash to extranct keys from their english name values
  
# NUMBER_NAMES = {
#   0 => 'zero', 
#   1 => 'one',
#   2 => 'two',
#   3 => 'three', 
#   4 => 'four', 
#   5 => 'five', 
#   6 => 'six', 
#   7 => 'seven', 
#   8 => 'eight', 
#   9 => 'nine', 
#   10=> 'ten', 
#   11=> 'eleven', 
#   12=> 'twelve', 
#   13=> 'thirteen', 
#   14=> 'fourteen', 
#   15=> 'fifteen', 
#   16=> 'sixteen', 
#   17=> 'seventeen', 
#   18=> 'eighteen', 
#   19=> 'nineteen',
# }

# def alphabetical_numbers(array )
#   array.map{|integer| NUMBER_NAMES[integer]}.sort.map{ |num_string| NUMBER_NAMES.key(num_string)}
# end

# p alphabetical_numbers([0,2,8,11] ) == [8,11,2,0]
# p alphabetical_numbers((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

#-----------Daily Double-----------------------------------------

#input: string
#output: new string
#rules:
  #return new string with all consecutive characters removed
  #no String#squeeze

#Algorithm
  #create empty string
  #split input string into array
  #compare each letter in array with previous letter
    #if same move on
    #else << to empty string
  #return new string

# def daily_double(string)
#  string.split('').each_with_object('') { |letter, new_string| new_string<< letter if letter != new_string.chars.last}
# end

# p daily_double('aaabbbccc')
# p daily_double('ddaaiillyy ddoouubbllee') == 'daily double'
# p daily_double('4444abcabccba') == '4abcabcba'
# p daily_double('ggggggggggggggg') == 'g'
# p daily_double('a') == 'a'
# p daily_double('') == ''

#---------BANNERIZE-----------------------------------------------------------------------

def bannerize (string)
puts (
"+-"+("-"*string.length)+"-+\n"+
"| #{' '*string.length} |\n"+
"| #{string} |\n"+
"| #{' '*string.length} |\n"+
"+-"+("-"*string.length)+"-+")
end
bannerize('aaasdsdsdsdsda')
bannerize('To boldly go where no one has gone before.')