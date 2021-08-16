#### SEARCHING 101

# five_numbers =[]

# loop do
#   puts "==> Enter the 1st number:"
#   first_number = gets.chomp.to_i
#  if first_number.integer?
#   five_numbers <<first_number
#   break
#  else puts "Invalid entry."
#  end 
# end
# loop do
#   puts "==> Enter the 2nd number:"
#   second_number = gets.chomp.to_i

#   if second_number.integer?
#     five_numbers <<second_number
#     break
#    else puts "Invalid entry."
#    end 
# end
# loop do
#   puts "==> Enter the 3rd number:"
#   third_number = gets.chomp.to_i

#   if third_number.integer?
#     five_numbers <<third_number
#     break
#    else puts "Invalid entry."
#    end  
# end
# loop do
#   puts "==> Enter the 4th number:"
#   fourth_number = gets.chomp.to_i

#   if fourth_number.integer?
#     five_numbers <<fourth_number
#     break
#    else puts "Invalid entry."
#    end 
# end
# loop do
#   puts "==> Enter the 5th number:"
#   fifth_number = gets.chomp.to_i

#   if fifth_number.integer?
#     five_numbers <<fifth_number
#     break
#    else puts "Invalid entry."
#    end 
# end
# last_number =nil
# loop do
#   puts "==> Enter the last number:"
#   last_number = gets.chomp.to_i

#   break if last_number.integer? 

#   puts "Invalid entry."
# end

# appears = five_numbers.include?(last_number)
# if appears
#   puts "The number #{last_number} appears in #{five_numbers}."
# else puts "The number #{last_number} does not appears in #{five_numbers}."
# end

###### ARITHMATIC INTEGER

# puts "==> Enter the first number:"
# one = gets.chomp.to_i
# puts "==> Enter the second number:"
# two = gets.chomp.to_i

# puts "#{one} + #{two} = #{one + two}"
# puts "#{one} - #{two} = #{one - two}"
# puts "#{one} * #{two} = #{one * two}"
# puts "#{one} / #{two} = #{one / two}"
# puts "#{one} % #{two} = #{one % two}"
# puts "#{one} ** #{two} = #{one ** two}"

##### COUNTING CHARACTERS

# puts "Please enter word or multiple words."
# words = gets.chomp
# # char_number = words.split.map{|word| word.split('')}.flatten.size
# char_number = words.delete(' ').size
# puts "There are #{char_number} in '#{words}'."

##### MULTIPLY TWO NUMBERS

#  def multiply(num1, num2)
#    num1 * num2
#  end
# puts multiply(5,3)

##### SQUARING AN ARGUMENT
# def square(num)
#   multiply(num, multiply(num, multiply(num, multiply(num, num))))
# end
# puts square(5)

##### EXCLUSIVE OR

# def xor? (one, two)
#   ( !!one || !!two) && ( !!one != !!two)
# end

# puts xor?(true, false)
# puts xor?(false, true)
# puts xor?(false, false)
# puts xor?(true, true)

##### ODD LIST

# def oddities (arr)
#   arr.select{ |e| arr.index(e).even? }
# end
# def evens (arr)
#   arr.select{ |e| arr.index(e).odd? }
# end

# def evens2 (arr)
#   even_elements = []
#   count=1
#   loop do
#     even_elements << arr[count]
#     count +=2
#     break if count>= arr.size
#   end
#   even_elements
# end
# p evens2([1,2,3,4,5,6])

# p oddities([1,2,3,4,5,6])
# p oddities([1,2,3,4,5,6])
# p oddities(['abc', 'ddd'])
# p oddities([123])
# p oddities([])

###### PALINDROME STRING

# def string_palindrome? (string)
#   string == string.reverse
# end
# def array_palindrome? (arr)
#   arr == arr.reverse
# end
#  def palindrome? (entry)
#    entry == entry.reverse
#  end

#  p palindrome?('madam')
#  p palindrome?(['madam', 'arr', 'madam'])
 
 ##### part 2

 
# def real_palindrome? (entry)
#   # reformat_entry = entry.downcase.gsub(/[^a-z0-9]/, '')
#   real_entry = entry.downcase.delete('^a-z0-9')
#   palindrome?(real_entry)
# end
# p real_palindrome?("Madam, I'm Adam")
# p real_palindrome?('356a653')

##### PALINDROMIC NUMBERS

# def palindrome? (entry)
#   entry == entry.reverse
# end
# def palindrome_number? (number)
#   number = number.to_s
#   palindrome?(number)
# end

# p palindrome_number?(1234321)
# p palindrome_number?(88)
# p palindrome_number?(834)
# p palindrome_number?(0007)
