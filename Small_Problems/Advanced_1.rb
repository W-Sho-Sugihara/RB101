#-------------Madlibs Revisited-------------------
# Input: string
# Return: string
# Goals: add random nouns, verbs, adjectives, and adverbs into given string and then output

# Rules
  # Explicit:
    #

  # Implicit:
    #

# Test Code:
  #

# Algorithm 

#create a hash with keys as noun, verbs, etc.
# values will be words in an array
# using interpolation add hash[key].sample to their respective places in the string

# TEXT = "The #{hsh[:adjective].sample} brown #{hsh[:noun].sample} #{hsh[:adverb].sample} #{hsh[:verb].sample} the #{hsh[:adjective].sample} yellow #{hsh[:noun].sample}, who #{hsh[:adverb].sample} #{hsh[:verb].sample} his #{hsh[:noun].sample} and looks around."

# text = File.read('/Users/shoandrie/Documents/Sho/Web Development/Launch School/RB101/Small_Problems/text.txt')
# p text

# def madlibs(text)
#   text += ''
#   hsh = {
#     adjective:  %w(quick lazy sleepy ugly),
#     noun: ['fox', 'dog', 'head', 'leg'],
#     verb: ['jumps', 'lifts', 'bites', 'licks'],
#     adverb: ['easily', 'lazily', 'noisily', 'excitedly']
#   }
# text.gsub!('%{adjective}', "#{hsh[:adjective].sample}")
# text.gsub!('%{verb}', "#{hsh[:verb].sample}")
# text.gsub!('%{noun}', "#{hsh[:noun].sample}")
# text.gsub!('%{adverb}', "#{hsh[:adverb].sample}")
# text

# end

#--------------------Seeing Stars------------------

# def seeing_stars(num)
#   top_half(num)
#   center(num)
#   bottom_half(num)
# end

# def top_half(n)
#   (n/2).times do |i|
#     puts ("*" + (" "*(n/2-i-1)) + "*" + (" "*(n/2-i-1)) + "*").center(n, " ")
#   end
# end

# def bottom_half(n)
#   (n/2).times do |i|
#     puts ("*" + (" " * i) + "*" + (" " * i) + "*").center(n, " ")
#   end
# end

# def center(n)
#   puts "*" * n
# end

#  seeing_stars(7)
#  seeing_stars(9)
#  seeing_stars(13)

#--------------------Transpose 3x3-----------------------
# Input: array of arrays (matrix)
# Return: new array of arrays
# Goals: transpose the given arrays in to a new array without using the #transpose method

# Rules
  # Explicit:
    # dont use #transpose, or the matrix class
    # dont mutate the given matri

  # Implicit:
    #

# Test Code:
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# Algorithm 

# make an empty array
# using a nested loop to obtain two indexes and using two index push the first element in all 'colums' as an array to the new array
# return new array 

# def new_matrix(array)
#   results_array = []
#   array.size.times do |element_index|
#     results_array << (0...array.size).map do |arr_index|
#       array[arr_index][element_index]
#     end
#   end
#   results_array
# end
# matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p new_matrix(matrix)
# p matrix


# def new_matrix(array)
#   array.size.times do |element_index|
#     array << (0 ..2).map do |arr_index|
#       array[arr_index][element_index]
#     end
#   end
#   array.shift(3)
#   array
# end
# matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
# p new_matrix(matrix)
# p matrix

#-----------------TRANSPOSE M X N------------------------
# Input:
# Return:
# Goals: 

# Rules
  # Explicit:
    #

  # Implicit:
    #

# Test Code:
# transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# transpose([[1]]) == [[1]]

# Algorithm 

#

# def transpose(array)
#     results_array = []
#     array[0].size.times do |element_index|
#       results_array << (0...array.size).map do |arr_index|
#         array[arr_index][element_index]
#       end
#     end
#     results_array
#   end

# p transpose([[1, 2, 3, 4]]) #== [[1], [2], [3], [4]]
# p transpose([[1], [2], [3], [4]]) #== [[1, 2, 3, 4]]
# p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) #==
# #   # [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose([[1]]) == [[1]]

#-------------rotating matrices---------------------

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
# def rotate(array)
#   results_array = []
#   array[0].size.times do |element_index|
#     results_array << ((0...array.size).map do |arr_index|
#       array[arr_index][element_index]
#     end).reverse
#   end
#   results_array
# end

# p rotate(matrix1)
# p rotate([
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ])

#--------------FIX THE BUG----------------------

# def my_method(array)
#   if array.empty?
#     []
#   elsif array.size > 1
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end

# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])

#-------------------MERGE SORTE LISTS-----------------
# Input: sorted arrays
# Return: one arrays 
# Goals: merge the two arrays 

# Rules
  # Explicit:
    # do not mutate the given arrays

  # Implicit:
    #

# Test Code:
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# Algorithm 

# either of the given arrays empty? if so return the other array end method
# make mutable dups of the given arrays
# find the shorter of the given arrays
# create an empty return array
# loop until both arrays are empty
# upon each iteration compare the first elements in the arrays and pus the lower one to the results.
# upon iteration if either array is empty then push the remainder of the elements to the results.
# return the results array

# def merge(arr1, arr2)
#   arr1 = arr1.dup
#   arr2 = arr2.dup
#   results_array = []

#   until arr1.empty? && arr2.empty? do
#     return arr2 if arr1.empty? # deals with the edge case of arr1 being empty
#     case arr1[0] <=> arr2[0] # if one arr empty returns nil
#     when 1 then results_array << arr2.shift
#     else        results_array << arr1.shift
#     end
#   end
#   results_array
# end

# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([1, 4, 5], []) == [1, 4, 5]
# p merge([], [1, 4, 5]) == [1, 4, 5]

#------------------MERGE SORT-------------------
# Input:
# Return:
# Goals: 

# Rules
  # Explicit:
    #

  # Implicit:
    #

# Test Code:
# merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
# merge_sort([5, 3]) == [3, 5]
# merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
# merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

# Algorithm 

#take the length of the given array and / 2
# #times that length and place the element in the current index and the next one into a sub array and push to a results array
# iterate through the results array and place each element in the subarrays in their own array using map
# iterate through the results array and compare the two elements in their own arrays and sort then flatten that level
# iterate through the results again and compare two arrays at a time and merge while sorting using previous method

# def merge_sort(arr)
#   return arr if arr.size == 1

#   first_half = arr[0..(arr.size-1)/2]
#   last_half = arr[(arr.size-1)/2+1..]
#   first_half = merge_sort(first_half)
#   last_half = merge_sort(last_half)

#   merge(first_half, last_half)
# end

# def merge(first_half, last_half)
#   sorted = []
#   until first_half.empty? || last_half.empty?
#     if first_half[0] < last_half[0]
#       sorted << first_half.shift  
#     else 
#       sorted << last_half.shift
#     end
#   end

#   if !first_half.empty?
#     sorted << first_half[0..]
#   end

#   if !last_half.empty?
#     sorted << last_half[0..]
#   end

#   sorted
# end

# p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]