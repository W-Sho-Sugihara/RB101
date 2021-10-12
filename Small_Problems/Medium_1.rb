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
# input: integer (n)
# output: array
# Rules: 
  # all lights start off
  # toggle all switches that are multiples of 1..n on order
  # toggle all multiples of 1, then all multiples of 2 then all multiples of 3, etc...until multiples of n
  # return which light are on after the nth iteration

# Algorithm
  # create array (1..n)
  # iterate through array and for every element iterate through array with a count and toggle switches that are multiples of the count, mutating array
  # select elements from array that are "on", transform 'on' lights to their index +1 then return

# def lights_on(n)
#   lights = {}
#   n.times { |i| lights[i+1] = false}

#   n.times do |i|
#     lights.each do |k, v|
#      lights[k] = !v if k % (i + 1) == 0
#     end
#   end
#   lights.select { |k, v| v == true}.keys
# end

# p lights_on(1000)

#---------------DIAMONDS--------------------------
# input: odd integer
# output: visual display of *'s
# Rules 
  # given int will always be a positive odd number
  # display a 4 point diamond in a `n` x `n` grid where `n` is the given int.


# Algorithm
  # using `#upto` iterate n times starting at 1, blok param is count
  # the block puts a string interpolation "#{'*' * count }" #center(9) if count is odd
  # using `#downto`, iterate n-1 times down to 1, block param set to count
  # the block puts a string inerpolation "#{'*' * count}" centered at 9 if count is odd.

# def diamond(n)
#   (1).upto(n) { |count| (puts ("*" * count).center(n)) if count.odd? }
#   (n-1).downto(1) { |count| (puts ("*" * count).center(n)) if count.odd? }
# end
# def outer_diamond(n)
#   (1).upto(n) do |count| 
#     if count == 1  
#       puts "*".center(n)
#     elsif count.odd?
#       puts ('*' + (" " * (count - 2)) + '*').center(n)
#     end
#   end
#   (n-1).downto(1) do |count| 
#     if count == 1
#       puts "*".center(n)  
#     elsif count.odd?
#       puts ('*' + (" " * (count - 2)) + '*').center(n)
#     end
#   end
# end


# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   if number_of_stars == 1
#     puts stars.center(grid_size)
#   else
#     puts ('*' + (' ' * (number_of_stars - 2)) + '*').center(grid_size)
#   end 
# end

# def outer_diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end
# diamond(3)
# outer_diamond(9)
# diamond(7)

#-------- STACK MACHINE------------------
# input: string of instruction
# Output: integer when instructions input 'print'

#Rules:
  # n Place a value n in the "register". Do not modify the stack.
  # PUSH Push the register value on to the stack. Leave the value in the register.
  # ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
  # SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
  # MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
  # DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
  # MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
  # POP Remove the topmost item from the stack and place in register
  # PRINT Print the register value
  # register starts at 0
  # all instructional inputs will be valid instruction

# Algorithm
  # Define method taking one argument
  # create empty register 
  # create empty stack array
  # split input string into array
  # if instruction is a string number convert to integer object then add to register
  # iterate throught array and eval the string. execute the algorithm of each instruction
  # use case statement to organize algorithms of instruction.

# def minilang(string)
#   register = 0
#   stack =[]
#   instructions = string.upcase.split(' ')
#   instructions.each do |instruction|
#     case instruction
#     when 'PUSH'  then stack.push(register)
#     when 'ADD'   then stack.pop += register
#     when 'SUB'   then (stack.pop -= register).abs
#     when 'MULT'  then stack.pop *= register
#     when 'DIV'   then register /= stack.pop
#     when 'MOD'   then register %= stack.pop
#     when 'POP'   then register = stack.pop
#     when 'PRINT' then p register
#     else              register = instruction.to_i
#     end
#   end
# end


# (3 + (4 * 5) - 7) / (5 % 3)

# minilang('3 push 5 mod push 5 push 4 mult push 3 add push 7 sub div print')

# minilang('add PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# ---------------WORD DIGIT-------------------------------------
# input: string 
# output: same string but mutated
# Rules:
  #change all spelled out numbers to their integer equivalant.

# Algorithm
  # init a hash with keys 'zero' through 'nine' with their equivalant integers 0-9
  # Split given string into an array
  # Iterate over string array with each with index
  # upon each iteration eval the current element with the keys of the hash, if key exists then replace the current element in the calling array using []=  and the current index to the value of the key: value pair where the key is the same name as the current element.


# def word_to_digit(string)
#   letter_num_array = ['zero', 'one', 'two','three','four','five','six','seven','eight','nine']
#   letter_num_array.each_with_index do |num_str, index|
#     string.gsub!(/\b#{num_str}\b/, index.to_s)
#   end
#   string
# end

# p word_to_digit('Please call me at five five five one two three four. Thanks.')

#-------Fibonacci Numbers (Recursion)-----------------
# Input: INTEGER `n`
# Return: integer
# Goals: find the fibonacci number at `n` in the fibonacci sequence

# Rules

  # Explicit:
    # use recursion

  # Implicit:
    #

# Test Code:
  #

# Algorithm 
#

# def fibonacci(n)
#   return 1 if n <= 2
#   n = fibonacci(n-1) + fibonacci(n-2)
# end

# def fibonacci_tail(nth, acc1, acc2)
#   if nth == 1
#     acc1
#   elsif nth == 2
#     acc2
#   else
#     fibonacci_tail(nth - 1, acc2, acc2 + acc1)
#   end
# end

# def fibonacci(nth)
#   fibonacci_tail(nth, 1, 1)
# end

# p fibonacci(80)
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

#-------Fibonacci Numbers (Procedural)------------------

# Input: integer, `n`
# Return: integer
# Goals: return the integer ar `n`th number of the fibonacci sequence

# Rules

  # Explicit:
    # no recursion

  # Implicit:
    #

# Test Code:
  #

# Algorithm 
# 

# def fibonacci(nth)
#   arr = [1,1]
#   (2).upto(nth-1) do |index|
#     arr << arr[index -1] + arr[index-2]
#   end
#   arr.last
# end

# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(20) == 6765
# p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001)  => 4202692702.....8285979669707537501

#-----------Fibonacci Numbers (Last Digit)------------
# Input:
# Return: the last digit of the nth number in the sequence
# Goals: 

# Rules

  # Explicit:
    #

  # Implicit:
    #

# Test Code:
  #

# Algorithm 
#

# def fibonacci_last(nth)
#   first, last = [1,1]
#   3.upto(nth) do
#     first, last = [last, (first+last)%10]
#   end
#   last.to_s.chars.last
# end

# p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# p fibonacci_last(100)   
# p fibonacci_last(123456789)   

