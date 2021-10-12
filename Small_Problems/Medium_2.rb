#----------------Longest Sentence------------------------
# Input: string
# Return: integer
# Goals: return the length of the longest sentence in the given string

# Rules

  # Explicit:
    # all sentences ending in '.', '!', "?" all qualify as a sentence.
    # all other punctuation and nonalphabetic chars are counted towards the word count (spaces do no count)

  # Implicit:
    #

# Test Code:
  #

# Algorithm 
# split the given string at '.', '!' and '?' and store in an array.
# find the word count of each sentence.(map count to new array)
# find the max length in the new array and return

# def longest_sentence(string)
#   separate_sent_arr = separate_sentences(string)
#   sentence_lengths = find_word_count(separate_sent_arr)
#   sentence_lengths.max(1)
# end

# def longest_paragraph(string)
#   separate_sent_arr = separate_paragraph(string)
#   sentence_lengths = find_word_count(separate_sent_arr)
#   sentence_lengths.max(1)
# end

# def separate_sentences(string)
#   string.split(/[.?!]/)
# end

# def separate_paragraph(string)
#   string.split(/\n{2,}/)
# end

# def find_word_count(array)
#   array.map { |sent| sent.split(' ').size}
# end

# p  longest_paragraph('Four score and seven years ago our fathers brought forth
#   on this continent a new nation, conceived in liberty, and
#   dedicated to the proposition that all men are created
#   equal.
  
#   Now we are engaged in a great civil war, testing whether
#   that nation, or any nation so conceived and so dedicated,
#   can long endure. We are met on a great battlefield of that
#   war. We have come to dedicate a portion of that field, as
#   a final resting place for those who here gave their lives
#   that that nation might live. It is altogether fitting and
#   proper that we should do this.
  
#   But, in a larger sense, we can not dedicate, we can not
#   consecrate, we can not hallow this ground. The brave
#   men, living and dead, who struggled here, have
#   consecrated it, far above our poor power to add or
#   detract. The world will little note, nor long remember
#   what we say here, but it can never forget what they
#   did here. It is for us the living, rather, to be dedicated
#   here to the unfinished work which they who fought
#   here have thus far so nobly advanced. It is rather for
#   us to be here dedicated to the great task remaining
#   before us -- that from these honored dead we take
#   increased devotion to that cause for which they gave
#   the last full measure of devotion -- that we here highly
#   resolve that these dead shall not have died in vain
#   -- that this nation, under God, shall have a new birth
#   of freedom -- and that government of the people, by
#   the people, for the people, shall not perish from the
#   earth.')

#------------I KNOW MY ABC'S----------------------

# Input: string
# Return: boolean
# Goals: to find if the given string uses the letters in the blocks only once. 

# Rules

  # Explicit:
    # one letter from each block can be used only once.
    # both letters cannot be used
    # the same letter cannot be used twice.

  # Implicit:
    # case insensitive

# Test Code:
  #block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

# Algorithm 
#create blocks array as a base reference
# upcase then split the given string in letters
# iterate through the letters and remove the corresponding block blocks_arr
# if all letters are able to remove blocks then return true, if at any point a letter is not able to find a corresponding block then return false

# def block_word?(string)
#   blocks_arr = [['B','O'],   ['X','K'],   ['D','Q'],   ['C','P'],   ['N','A'],
#                ['G','T'],   ['R','E'],   ['F','S'],   ['J','W'],   ['H','U'],
#                ['V','I'],   ['L','Y'],   ['Z','M']]
#   string.upcase.chars.select do |letter|
#     if letter_in_block?(letter, blocks_arr)
#     remove_block!(letter, blocks_arr)
#     else
#       return false
#     end
#   end
#   true
# end

# def letter_in_block?(letter, blocks_arr)
#   blocks_arr.flatten.include?(letter)
# end

# def remove_block!(letter, arr)
#   arr.map! do |sub_arr|
#     if sub_arr.include?(letter)
#       []
#     else  
#       sub_arr
#     end
#   end
#   arr
# end

# p block_word?('BATCH') #== true
# p block_word?('BUTCH') #== false
# p block_word?('jest') #== true
 
#-----------Lettercase Percentage Ratio--------------------
# Input: string
# Return: hash
# Goals: return what percetage of the string is uppercase, lowercase, or neither.

# Rules

  # Explicit:
    # string will always have one value
    # 

  # Implicit:
    #

# Test Code:
# letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# Algorithm 

# init hash with keys as the goals values 0
# split string and iterate through it looking for uppercase, lowercase or neither and increment the hash.

# def letter_percentages(string)
#   hash = {}

#   lowercase_count_percentage = ((string.scan(/[a-z]/).size).to_f / string.length) * 100
#   uppercase_count_percentage = ((string.scan(/[A-Z]/).size).to_f / string.length) * 100
#   neither_count_percentage = ((string.scan(/[^A-Za-z]/).size).to_f / string.length) * 100
#   hash[:lowercase] = lowercase_count_percentage.round(1)
#   hash[:uppercase] = uppercase_count_percentage.round(1)
#   hash[:neither] = neither_count_percentage.round(1)

#   hash
# end


# p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('abcdefGHI') #== { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

#----------------Matching Parentheses?-----------
# Input: string
# Return: boolean
# Goals:  find if all the parentheses match

# Rules

  # Explicit:
    #all parentheses must start with '(' and end in ')'.


  # Implicit:
    #

# Test Code:
# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false

# Algorithm 
# delete all non parentheses characters from string
# iterate through the string and remove () pairs 


# def balanced?(string, pair)
#   only_pairs = string.delete("^#{pair}")
#   0.upto(only_pairs.size/2) do |_|
#     only_pairs.gsub!(pair, '')
#   end
#   only_pairs.empty?
# end

# p balanced?('What ("is") this?', '""') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false


#------------TRIANGLE--------------------
# Input: 3 integers
# Return: symbol
# Goals: find if the three integers make a triangle, is so, which triangle

# Rules

  # Explicit:
    # all three sides are equal is an equilateral triangle
    # two sides are equal is an isosceles triangle
    # all three side are different lengths is a scalene triangle
    # the two shortest sides added must be greater than the remaining side
    # no sides can be zero length, returns `:invalid`

  # Implicit:
    #

# Test Code:
# triangle(3, 3, 3) == :equilateral
# triangle(3, 3, 1.5) == :isosceles
# triangle(3, 4, 5) == :scalene
# triangle(0, 3, 3) == :invalid
# triangle(3, 1, 1) == :invalid

# Algorithm 

# create an array and ad the given three integers
# array include? 0? if so return invalid
# sort array and add the first two and check if sum is greater than the third num, if not return invalid
# call #tally on the array then count the keys. if one key return equilateral, if two keys return isosceles, if three keys return scalene.

# def triangle(n1, n2, n3)
#   arr = [n1, n2, n3].sort
#   return :invalid if arr.include?(0) || arr[0..1].sum <= arr[2]
#   case arr.tally.keys.size
#     when 3 then :scalene
#     when 2 then :isosceles
#     when 1 then :equilateral
#   end
# end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

#---------Tri-Angles-----------------------------------
# Input: three ints
# Return: symbol
# Goals: find if the given integers make a valid triangle is so which one and if not return invalid

# Rules

  # Explicit:
    # all three integers must equal 180 to be valid
    # all angles must be greater than o
    # one angle 90 the return right triangle
    # one angle greater than 90 return obtuse
    # all angles less than 90 return acute

  # Implicit:
    #

# Test Code:
# triangle(60, 70, 50) == :acute
# triangle(30, 90, 60) == :right
# triangle(120, 50, 10) == :obtuse
# triangle(0, 90, 90) == :invalid
# triangle(50, 50, 50) == :invalid

# Algorithm 
# :right, :acute, :obtuse, or :invalid

# create array with given angles
# return invalid if sum of angles != 180 or if one angle is 0
# array.all? less than 90 then return acute
# array.any? 90 then return right
# array.any? greatert than 90 return obtuse

# def triangle(n1, n2, n3)
#   arr = [n1, n2, n3]
#   return :invalid if arr.include?(0) || arr.sum != 180
#   return :right if arr.any? { |side| side == 90 }
#   return :obtuse if arr.any? { |side| side > 90 }
#   return :acute if arr.all? { |side| side < 90 }
# end

# p triangle(60, 70, 50) == :acute
# p triangle(30, 90, 60) == :right
# p triangle(120, 50, 10) == :obtuse
# p triangle(0, 90, 90) == :invalid
# p triangle(50, 50, 50) == :invalid

#----------------Unlucky Days---------------------------------
# Input: year
# Return: integer
# Goals: find the number of friday the 13th there are in the given year

# Rules
  # Explicit:
    # use the gregorian calender
    # the year will be greater than 1752

  # Implicit:
    # year may be a future date

# Test Code:
# friday_13th(2015) == 3
# friday_13th(1986) == 1
# friday_13th(2019) == 2

# Algorithm

# create friday counter = 0
# iterate throught the months of the given year and check if the 13th of that month is a friday
# if true then add 1 to fridays counter.
# return the fridays counter

# def friday_13th(year)
#   fridays = 0
#   1.upto(12) do |month|
#     fridays +=1 if Time.new(year, month, 13).friday?
#   end
#   fridays
# end

# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2


# require "date"

# def friday?(year, month, day)
#   Date.new(year, month, day).friday?
# end

# def days(month, year)
#   if month == 1 || month == 3 || month == 5 || 
#     month == 7 || month == 8 || month == 10 || 
#     month == 12
#     31
#   elsif month == 4 || month == 6 || 
#     month == 9 || month == 11
#     30
#   elsif Date.new(year).leap?
#     29
#   else
#     28
#   end
# end

# def five_fridays(year)
#   months_with_five = 0
#   fridays = 0

#   1.upto(12) do |month|
#     days = days(month, year)

#     1.upto(days) do |day|
#       fridays +=1 if friday?(year, month, day)
#     end
#     months_with_five += 1 if fridays == 5
#     fridays = 0
#   end

#   months_with_five
# end

#  p five_fridays(2019) 
#  p five_fridays(2020)
#  p five_fridays(2021)
#  p five_fridays(2022)

#----------Next Featured Number Higher than a Given Value-----------
# Input: integer
# Return: integer
# Goals: find the next 'featured' number

# Rules
  # Explicit:
    # multiple of 7
    # odd number
    # no repeating digits
    # return error if no number exists

  # Implicit:
    #

# Test Code:
# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999) #== error

# Algorithm 

# find the first element in array that is greater than the given integer and return it
# if no elements are found then error is outputted.

# def featured(num)
#   return :error if num >= 9876543210
#   num+=1 until num%7==0 && num.odd? && num.digits.uniq == num.digits
#   num
# end

# p featured(12)

#----------------------BUBBLE SORT--------------------
# Input: array
# Return: new array
# Goals: sort the given arrayusing the bubble sorting argorith

# Rules
  # Explicit:
    # iterate through the array and eval each pair and sort, when nothing is sorted upon iteration then return the new array

  # Implicit:
    # given array can be an array of strings

# Test Code:
# array = [5, 3]
# bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Algorithm 

# eval the first two elements and sort 
# then eval the 2nd and 3rd elements and sort
# do this for all element s in the array
# iterate throught the array again and again until no changes are made
# return the now sorted array

# def bubble_sort!(array)
#   changes = true 
#   loop do
#     changes = swap?(array)
#     break if changes == false
#   end
#   array
# end

# def swap?(array)
#   changes = false
#   array.each_with_index do |elem, index|
#     if (elem <=> array[index + 1]) == 1
#       array[index], array[index+1] = array[index+1], array[index]
#       changes = true
#     end
#   end
#   changes
# end

# def bubble_sort!(array)
#   n = array.size - 1
#   loop do
#     newn = 0
#     swapped = false
#     1.upto(n) do |index|
#       next if array[index - 1] <= array[index]
#       array[index - 1], array[index] = array[index], array[index - 1]
#       newn = index
#     end
#     n = newn
#     break if n <= 1
#   end
#   array
# end

# array = [5, 3]
# p bubble_sort!(array)
# array == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

#----------------SUM SQUARE - SQUARE SUM-----------------
# Input: INTEGER
# Return: INTEGER
# Goals: find the difference between the square of given int and the sum of the squares of the numbers from 1 to int

# Rules
  # Explicit:
    #

  # Implicit:
    #

# Test Code:
# sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# sum_square_difference(10) == 2640
# sum_square_difference(1) == 0
# sum_square_difference(100) == 25164150

# Algorithm 

# init var with the value square of given int
# init var with the total sum of the integers 1..int squared
# find the difference

# def sum_square_difference(int)
#   squared_sum = (1..int).sum ** 2
#   sum_of_squares = (1..int).reduce { |sum, num| sum + num **2}
#   squared_sum - sum_of_squares
# end



# p sum_square_difference(3) == 22
#    # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
# p sum_square_difference(10) == 2640
# p sum_square_difference(1) == 0
# p sum_square_difference(100) == 25164150