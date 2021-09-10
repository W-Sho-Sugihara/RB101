# ----------rotate 1 -------------------------
# input: array
# output: new array
# Rules: 
  #the first valu becomes the last value
  # dont use #rotate
  # dont mutate the caller/original array

# Algorithm
  #init new array = to input array clone
  #push the return value of shift of new array to new array

# def rotate_array(array)
#   arr2 = array.clone
#   arr2 << arr2.shift
# end

# def rotate_string(string)
#   rotate_array(string.chars).join
# end

# def rotate_integer(integer)
#   rotate_array(integer.to_s.chars).join.to_i
# end

# p rotate_array([7, 3, 5, 2, 9, 1])# == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
# p rotate_array(['a']) #== ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true



# p rotate_string('asdfgh')
# p rotate_integer(123456)

#----------------ROTATE 2-----------------------
# input: 2 integers (number & n)
# output: new integer
# Rules:
  # rotate the last n digits in the given number
  # n=1 doesnt change the number
  # n will always be positive

# Algorithm
  # number to string 
  # number [n+1..] pass into rotate_string, add return value to number[0..n]


# def rotate_rightmost_digits(number, n)
#   (number.to_s[0...-n] + rotate_string(number.to_s[-n..])).to_i
  
# end

# p rotate_rightmost_digits(12345, 1)
# p rotate_rightmost_digits(12345, 2)
# p rotate_rightmost_digits(12345, 3)
# p rotate_rightmost_digits(12345, 4)
# p rotate_rightmost_digits(12345, 5)

#-----------ROTATE 3-----------------------
# input: number
# output: new number
# Rules: return maximum rotation

# def max_rotation(number)
#   (number.to_s.size).downto(1) { |n| number = rotate_rightmost_digits(number, n) }
#   number.to_i
# end

# def max_rotation(num)
#   str = num.to_s

#   (0...str.length).each do |i|
#     str << str[i] 
#     str[i] = ""
#   end

#   str.to_i
# end

# p max_rotation(1234567) #== 321579
# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

#-------------- 1000 Lights ---------------------------
