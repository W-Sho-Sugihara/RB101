#---------sum of sums-------------

#input: array
#output: integer
#Rules
  #Explicit rules:
    #given array contains only integers

  #Implicit rules:
    #given an empty array will return 0

#Algorithm:
  #map through each element
  #return a new array for each element that includes itself and all previous elements
  #flatten returned array
  #sum array

# def sum_of_sums(array)
#   array.flat_map { |ele| array.select { |n| array.index(n) <= array.index(ele)} }.sum
# end

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

#---------------MADLIBS-----------------------------

# input_array = []

# puts "Enter a noun: (eg. dog)"
# input_array << gets.chomp.downcase
# puts "Enter a verb: (eg. walk)"
# input_array << gets.chomp.downcase
# puts "Enter a adjetive: (eg. blue)"
# input_array << gets.chomp.downcase
# puts "Enter a adverb: (eg. quickly)"
# input_array << gets.chomp.downcase

# puts "Do you #{input_array[1]} your #{input_array[2]} #{input_array[0]} #{input_array[3]}? That's hilarious!!"

#--------LEADING SUBSTRING-----------------------

#input: string
#output: array of substring
#Rules
  #Explicit:
    #values should be sorted from shortest to longest
    #inputs will always be strings
  #Implicit:
    #only one letter should return an array with one element

#Algorithm
  #split string into array
  #iterate through each element
  #select each element and all previous ones and join them together

# def leading_substrings(string)
  # str_arr = string.split('')

  # string.chars.map.with_index { |_, i| string[0..i] }

  # sub_string = ''
  # sub_string_array = []
  # count = 0
  # loop do
  #   sub_string += str_arr[count]
  #   sub_string_array << sub_string
  #   count +=1
  #   break if count == str_arr.size
  # end
  # sub_string_array
# end

# p leading_substrings('abc')
# p leading_substrings('xyzzy')
# p leading_substrings('x')

#-----------------ALL SUBSTRINGS------------------

#input: string
#output: array
#rules:
  #explicit:
    #return all possible substrings
    #array starts at all substrings beginning with string[0] and then to string[1], etc

  #implicit:
    #empty string returns empty array

#Algorithm
  #split string into array
  #map through array
  #

# def substrings(string)
#   str_arr = string.chars
#   sub_string_array = []
#   string.size.times do |starting_index|
#     sub_string = ''
#     count = starting_index
#     loop do
#       sub_string += str_arr[count]
#       sub_string_array << sub_string
#       count +=1
#       break if count == str_arr.size
#     end
#   end
#   sub_string_array

# end

# p substrings('abc')
# p substrings('xyzzy')
# p substrings('x')

#-------------Palindromatic Substrings-----------------
#input: string
#output: array
#Rules:
  #explicit:
    #case sensitive
    #single letters are not palindromes
    #values should be in order they appear in original string
    #all duplicates should be inlcuded

#Algorithm
  #


# def leading_substrings(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]    
#   end
#   result
# end

# def substrings(string)
#   result = []
#   (0...string.size).each do |start_index|
#     this_substring = string[start_index..-1].downcase.gsub(/[^a-z0-9]/, ' ')
#     # this_substring = string[start_index..-1].downcase.delete('^a-z0-9')
#     result.concat(leading_substrings(this_substring))
#   end
#   result
# end

# def palindromes(string)
#   all_substrings = substrings(string)
#   all_substrings.select { |ele| ele == ele.reverse && ele.size > 1 }
# end

# p palindromes('abcd')
# p palindromes('Madam')
# p palindromes('hello-Madam-did-Madam-goodbye')
# p palindromes('knitting cassettes')

#----------fizzbuzz----------------------
#input: two integers 
#output: integers between the given inputs
#rules:
  #explicit:
    #integers divisible by 3 will output fizz instead
    #integers divisible by 5 will output buss instead
    #integers divisible by both 3 & 5 will output fizzbuzz instead

#Alagorithm
  #put given inputs into a range and iterate through it (`#each`)
  #during iterataion, check if current element is divisible by 3, 5, or both.
  #if 3 output 'fizz', if 5 output 'buzz', if both output 'fizzbuzz', else output current element

# def fizzbuzz(start, fin)
#   (start..fin).each do |num|
#     if num % 3 == 0 && num % 5 == 0
#       puts 'fizzbuzz'
#     elsif num % 5 == 0
#       puts 'buzz'
#     elsif num % 3 == 0
#       puts 'fizz'
#     else
#       puts num
#     end
#   end
# end

# fizzbuzz(1, 15)

#-------------DOUBLE CHAR---------------------

#input: string
#output: new string
#rules:
  #double each letter
  #empty input, empty output

# algorithm
  # map split string
  # for each iterationg `#* 2` on current element
  # join mapped array

# def repeater(string)
#   string.chars.map { |char| char * 2 }.join('')
# end

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

#----------------DOUBLE CHARS 2--------------------

# input: string
# output: new string
# rules: double consonants only. Don't double whitespace, punctuation, etc.

# Algorithm
  # iterate through split string with map
  # if current element is a consonant then double, otherwise current element


# def double_consonants(string)
#   string.chars.map { |char| char.match(/[a-z&&[^aeiou]]/i) ? char * 2 : char }.join
# end

# def double_consonants(string)
#   string.gsub(/[a-z&&[^aeiou]]/i) { |char| char * 2 }
# end

# p double_consonants('string')
# p double_consonants("Hello-World!")
# p double_consonants("July 4th")
# p double_consonants('') == ""

#------------REVERSE THE DIGITS IN A NUMBER-----------------

# input: integer
# output: integer

# rules:
  #reverse the number given and delete all leading 0's in return value.

# Algorithm
  #convert number to string
  #reverse string
  #delete all leading 0's
  #conver to integer

# def reversed_number(int)
#   int.to_s.reverse.to_i
# end

# p reversed_number(12345) #== 54321
# p reversed_number(12213) #== 31221
# p reversed_number(456) #== 654
# p reversed_number(12000) #== 21 # No leading zeros in return value!
# p reversed_number(12003) #== 30021
# p reversed_number(1) #== 1

#----------GET THE MIDDLE--------------------------
# input: string
# output: new string
# Rules:
  # if string length is odd return one value, if string length is even return two values

# Algorothm
  # set string length to `Float`
  # divide string length by 2 rounding down and store as middle index
  # if string length odd return the string[middle index]
  # if string length even return string[middle index.. middle index + 1]

# def center_of(string)
#   middle_index = string.length / 2
#   if string.length.odd?
#     string[middle_index]
#   else
#     string[(middle_index - 1)..(middle_index)]
#   end
# end

# p center_of('I love ruby') #== 'e'
# p center_of('Launch School') #== ' '
# p center_of('Launch') #== 'un'
# p center_of('Launchschool') #== 'hs'
# p center_of('x') #== 'x'