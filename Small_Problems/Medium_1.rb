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

def rotate_array(array)
  arr2 = array.clone
  arr2.push(arr2.shift)
end

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_integer(integer)
  rotate_array(integer.to_s.chars).join
end
# p rotate_array([7, 3, 5, 2, 9, 1])# == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
# p rotate_array(['a']) #== ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true



p rotate_string('asdfgh')
p rotate_integer(123456)

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

