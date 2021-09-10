#-----------------WELCOME STRANGER----------------
# input: array and hash
# output: string
# Rules

# def greetings(arr, hsh)
#   puts "Hello, #{arr.join(' ')}!"\
#   " Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
# end

# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# # => Hello, John Q Doe! Nice to have a Master Plumber around.

#---------------DOUBLE DOUBLE---------------------

# input: integer
# output: integer
#rules:
  #returns self is number is a double double
  #else returns number * 2


# def twice(number)
#   double_double?(number) ? number : number * 2
# end

# def double_double?(number)
#   return false if number.to_s.length < 2
#   middle_index = number.to_s.length / 2 
#   first_half = number.to_s[0..middle_index - 1]
#   second_half = number.to_s[middle_index..-1]
#   first_half == second_half
# end

# p twice(12341235)
# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

#-------------ALWAYS RETURN A NEGATIVE-------------------
# input: integer
# output: integer
# Rules:
  # if integer > 0 then return the as a negative, else return integer

  # Algorithm
    # check if given `number` larger than 0
    # if larger than 0 return negative `number`
    # else return `number`

# def negative(int)
#   int > 0 ? -int : int
# end

# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0

#--------------COUNTING UP--------------------------
# input: int
# output: arr of ints
# rules: int will always be greater than 0
       # return array will be a range from 1 to given int


# Algorithm
# iterate over range of 1 through `int` with `each_with_object(array)`
# shovel each current element into the new array


# def sequence(int)
#   (1..int).each_with_object([]) { |num, arr| arr << num }
# end
# def sequence(int)
#   int.positive? ? (1..int).to_a : (int..1).to_a.reverse
# end


# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(-8) #== [1]

#----------------UPPERCASE?----------------------------
# input: string
# output: boolean
# Rules: write a method with a parameter accepting a string
  # given a string as argument
  # return value is boolean, true if string is all uppercase letters, otherwise false
  # non alphabetic chars ignored
  #empty string return true
  
# Algorithm
  # check if given string contains lowercase letters. if true return false, if flase, return true

# def uppercase?(string)
#   string.index(/[a-z]/) == nil 
# end

# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

#--------------HOW LONG ARE YOU?-----------------------

# input: string
# output: array
# Rules:
  # each word in the given string should be an element in the array with a space its word length appended to it as a string. eg: "word 4"
  # non chars are counted in word lengh, white space is not. 
  # words will be separated by a single space.

# Algorithm 
  # split string
  # map it 
  # block will use interpolation and current element to calc word length
  # return mapped array

# def word_lengths(string)
#   string.split(' ').map { |word| "#{word} #{word.size}" }
# end

# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
 
# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
 
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
 
# p word_lengths("Supercalifragilisticexpialidocious") ==
#    ["Supercalifragilisticexpialidocious 34"]
 
# p word_lengths("") == []

#--------------NAME SWAPPPING--------------------
# input: string
# output: new string
# Rules:
  # first and last name given separated by a single space
  # return name reversed separated by a comma and a single space.

# Algorithm
  # string split reverse foin with comma and space

# def swap_name(name)
#   name.split(' ').reverse.join(', ')
# end

# p swap_name('Joe Roberts') == 'Roberts, Joe'

#-----------SEQUENCE COUNT------------------------

# input: 2 integers
# output: array
# Rules:
  # create method with 2 params, both need to be integers
  # first `int` will be count (number of elements in final array)
  # second `int` is starting num.
  # subsequent values will increment by startng number ( if 2, [2, 4, 6, 8, etc]) 
  # if first int is 0 return empty array

# Algorithm 
  # init empty array
  # first `int`.times, block will have local var count
  # `#times` will push second given `int` multiplied by current times count + 1

# def sequence(count, start)
#   arr = []
#   count.times { |i| arr << start * (i + 1) }
#   arr
# end

# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

#------------------GRADE BOOK-------------------------
# input: 3 integers
# output: string
# Rules: given 3 ints between 0 & 100
  # return a grade based on the mea average of the three scores.


# Algorithm
  # init array with the three given ints inside
  # average = sum array, divide total by the array length.
  # use case average and return corrisponding grade

# def get_grade(score1, score2, score3)
#   average = (score1 + score2 + score3) / 3
#   case average
#   when 90.. then "A"
#   when 80..90 then "B"
#   when 70..80 then "C"
#   when 60..70 then "D"
#   else "F"
#   end
# end

# p get_grade(100, 90, 120)
# p get_grade(80, 90, 86)
# p get_grade(70, 77, 79)
# p get_grade(60, 66, 68)
# p get_grade(10, 9, 6)
# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"



#---------RB109 study session--------

# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

# require "prime"

# def how_many_nonprime_odd?(int)
#   (1..int).select { |ele| ele.odd? }.select { |ele| ele % 3 != 0 && ele % 5 !=0 }.count 
# end

# p how_many_nonprime_odd?(10)




#----------GROCERY LIST-------------------
# input: nested array
# ouput: new array
# rules: 
  # takes nested arrays of item and quantity and returns a new array with the correct quantity of elements

# Algorithm
  # iterate through each nested array using each_with_object([])
  # call #times on the second item in array(the quantity) and << to new array the grocery item for every iteration of #times 

# def buy_fruit(list)
#   list.each_with_object([]) do | sub_arr, new_list| 
#     sub_arr[1].times { |_| new_list << sub_arr[0] } 
#   end
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) 

#------------GROUP ANAGRAMS-----------------------------
# INPUT: array
# ouptu: new arrays
# Rules:
  #


# def anagrams(string_array)
#   arr = []
#   string_array.each do |word|
#     arr << string_array.select { |word2| word2.split('').sort == word.split('').sort }
#   end
#   arr.uniq.each { |sub_arr|  p sub_arr }
# end

# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#   'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#   'flow', 'neon']

#   anagrams(words)