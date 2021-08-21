##--------------Cute Angles--__--___-___--_____________----______---_______---__-

# DEGREE = "\xC2\xB0"
# MINUTES_IN_DEGREE=60
# SECONDS_IN_MINUTE=60
# SECONDS_IN_DEGREE =MINUTES_IN_DEGREE*SECONDS_IN_MINUTE 


# def float_to_degrees(float)
#   if float<0
#     until float >=0
#       float * SECONDS_IN_DEGREE
#       float += SECONDS_IN_DEGREE
#     end
#   end
#   total_seconds = (SECONDS_IN_DEGREE*float).round
#   degrees, minutes = total_seconds.divmod(SECONDS_IN_DEGREE)
#   minutes, seconds = minutes.divmod(MINUTES_IN_DEGREE)
#   _, degrees = degrees.divmod(360)
#   degrees.to_s
#   minutes = format("%02d", minutes)
#   seconds = format("%02d", seconds)
#   %(#{degrees}#{DEGREE}#{minutes}'#{seconds}")
# end

#  def float_to_degrees (float)
  
#   degrees = float.truncate
#   minutes = (((float - degrees)* 0.6)*100).floor
#   seconds = (((((float - degrees)* 0.6)*100 - minutes)* 0.6)*100).round
#   if seconds ==60
#     minutes += 1
#     seconds =0
#   end
#   degrees.to_s
#   minutes = format("%02d", minutes)
#   seconds = format("%02d", seconds)
  
#   %(#{degrees}#{DEGREE}#{minutes}'#{seconds}")
# end 


#  p float_to_degrees(400)
#  p float_to_degrees(-420)
#  p float_to_degrees(-40)
#  p float_to_degrees(76.73)
#   p float_to_degrees(30) == %(30°00'00")
#  p float_to_degrees(76.73) == %(76°43'48")
#  p float_to_degrees(254.6) == %(254°36'00")
#  p float_to_degrees(93.034773) == %(93°02'05")
#  p float_to_degrees(0) == %(0°00'00")

##----------------DELETE VOWELS_____---_----------______-----_---____--_-__--

#input: array of strings
#output: new array of strings
#Rules:
  #return array with same number of values but all vowels removed
  #if string becomes empty, return empty string
  # case incensitive

#Algorithm
  #map through each value of array and delete vowels

#   def remove_vowels(arr_of_string)
#     arr_of_string.map { |string| string.delete('aeiouAEIOU')}
#   end

# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

#------------FIBONACCI NUMBERS-----------------------------
#input: integer
#output: integer
#Rules: 
  # return the index (starting at 1) of the first integer within fibonacci sequence that has the number if given digits.
  # input will be greater than 1
  
# Algorithm
  #run fibonacci sequence until last value has the same length as given digit
  #

# def where_in_fibonacci (digits)
#   fib_array =[1,1]
#   until fib_array[-1].to_s.length >= digits
#     fib_array << fib_array[-1] + fib_array[-2]
#   end
#   fib_array.length
# end

# p where_in_fibonacci(2) == 7          # 1 1 2 3 5 8 13
# p where_in_fibonacci(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p where_in_fibonacci(10) == 45
# p where_in_fibonacci(100) == 476
# p where_in_fibonacci(1000) == 4782
#  where_in_fibonacci(10000) == 47847

#------------------REVERSE ARRAY---------------------------------
#input: array
#output: mutated input array
#Rules:
  #must return mutated input array, not a new rray
  # reverse the values within array without using .reverse and .reverse!

# def reverse_array(arr)
#   (arr.length/2).times { |num| arr[num], arr[-(num+1)] = arr[-(num+1)],arr[num]}
#   arr
# end
# p reverse_array([1,2,3,4,5])
# p reverse_array(%w(a b e d c))
# p reverse_array(['abc'])
# p reverse_array([])

#------------------REVERSE ARRAY Part 2---------------------------------
#input: array
#output: new array
#Rules:
  #return newarray
  # reverse the values within array without using .reverse and .reverse!

# def reverse_array(array)
#   array.each_with_object([]){ |value, arr| arr.unshift(value)}
# end


# p reverse_array([1,2,3,4,5])
# p reverse_array(%w(a b e d c))
# p reverse_array(['abc'])
# p reverse_array([])

#-----------------COMBINING ARRAYS--------------------------------

# def merge(arr1, arr2)
#   arr1.union(arr2)
# end

# def merge(arr1, arr2)
#   new_array=[]
#   new_array<<arr1
#   arr2.each { |value| new_array<< value unless new_array.include?(value)}
#   new_array.object_id
# end

# a=[1, 3, 5]
# b=[3, 6, 9]
# p merge(a, b)
# p a.object_id
# p b.object_id
# merge([9, 3, 5,1], [3, 6, 8,1])

#----------------HALVSIES---__--_----_-_---------_-_----_-_-_-_--_-_-_-_-_--_-_-_
#input: array
#output: new array
#rules: 
  #first half of given array is the first sub-array in new_array
  #second-half of given array if the second sub-array in new_array
  #for odd sized arrays, middle value is placed in the first half
  #if only one value goes in first half

# def halvsies(array)
#   if array.size.even?
#     array.partition{ |value| array.index(value) < array.size/2}
#   elsif array.size.odd?
#     array.partition{ |value| array.index(value) <= array.size/2}
#   end
# end


# def halvsies(array)
#     array.partition{ |value| array.index(value) < (array.size/2.0).ceil} 
# end

# p halvsies([1, 2, 3, 4])
# p halvsies([1, 5, 2, 4, 3])
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

#------------------------FIND THE DUPLICATE---------------------_---
#INPUT: array
#output: integer
#Rules:
  #find the duplicate integer within the given array.
  #always only one duplicate

# def find_duplicate (arr)
#   arr.find { |v| arr.count(v) > 1 }
# end


# p find_duplicate([1, 5, 3, 1]) == 1
# p find_duplicate([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

#----------------DOES MY LIST INCLUDE THIS?-----------------------==-=-=-=
#INPUT: array and search value
#output: boolean
#Rules: 
  #search through array for matching search value, return true if found, false if not found


# def include? (arr, search_parameter)
#   arr.select{ |value| value == search_parameter}.size==1
# end

# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

#---------------Right Triangle-------------------------------
#input: int
#output: triangle
#rules:


def right_triangle (num, corner_direction = 'right bottom')

  case corner_direction.downcase
  when 'right bottom'
    num.times { |i| puts "#{('*'*(i+1)).rjust(num)}"}
  when 'left bottom'
    num.times { |i| puts "#{('*'*(i+1)).ljust(num)}"}
  when 'right top'  
    num.times { |i| puts "#{('*'*(num-i)).rjust(num)}"}
  when 'left top'
    num.times { |i| puts "#{('*'*(num-i)).ljust(num)}"}
  else
    num.times { |i| puts "#{('*'*(i+1)).rjust(num)}"}
  end
end

right_triangle(5, 'sss')
right_triangle(5,'left top')
right_triangle(5,'right top')
right_triangle(5,'left bottom')