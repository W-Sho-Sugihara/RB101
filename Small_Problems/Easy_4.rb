##### short long short

# def short_long_short(str1, str2="")
#   str1.size > str2.size ? str2+str1+str2 : str1+str2+str1
# end

# puts short_long_short('abc', 'defgh')
# puts short_long_short('abcde', 'fgh')
# puts short_long_short('xyz')

##### WHAT CENTURY IS IT?

# def century (year)
#   century =  (year.to_f/100).ceil.to_s
#   century + century_suffix(century)
# end

# def century_suffix(century)
#     if ['11', '12', '13'].include?(century[-2..-1])
#       'th'
#     else
#       case century[-1]
#       when '1' then 'st'
#       when '2' then 'nd'
#       when '3' then "rd"
#       else 
#         'th'
#       end
#     end
  
# end

# puts century(2000) 
# puts century(2001) 
# puts century(1965) 
# puts century(256) 
# puts century(5) 
# puts century(10103)
# puts century(1052) 
# puts century(1127) 
# puts century(11201) 

##### Leap Years part 1 

# def leap_year? (year)
#   if year%4 == 0
#     if year%100 == 0
#       if year%400 == 0 
#         true
#       else false
#       end
#     else true
#     end
#   else false
#   end
# end


##### Leap Year part 2

# def julian_leap_year?(year)
#   if year >1752
#     leap_year?(year)
#   else year%4 ==0
#   end
# end



# puts julian_leap_year?(2016) == true
# puts julian_leap_year?(2015) == false
# puts julian_leap_year?(2100) == false
# puts julian_leap_year?(2400) == true
# puts julian_leap_year?(240000) == true
# puts julian_leap_year?(240001) == false
# puts julian_leap_year?(2000) == true
# puts julian_leap_year?(1900) == false
# puts julian_leap_year?(1752) == true
# puts julian_leap_year?(1700) == true
# puts julian_leap_year?(1) == false
# puts julian_leap_year?(100) == true
# puts julian_leap_year?(400) == true

###### Multiples of 3 and 5

# def multisum(num)
#   (1..num).filter{ |num| num%3 == 0 || num%5 == 0}.reduce{ |sum, num| sum +num}
# end

# puts multisum(3)
# puts multisum(5) 
# puts multisum(10) 
# puts multisum(1000) 

###### Running Total

# def running_total (arr)
#   totals = []
#   tally = 0
#   arr.each do |num|
#     totals << (num + tally)
#     tally = totals[-1]
#   end
#   totals
# end

# def running_total(arr)

#   new_array = arr.each_with_object([0]) do |element, new_array|
#     new_array<< element +new_array[0]
#   end

# end


# p running_total([2, 5, 13])
# p running_total([14, 11, 7, 15, 20]) 
# p running_total([3]) 
# p running_total([]) 

##### String to a Number


# def convert (string)
#   digits = string.split('').map do |string_num|
#     case string_num
#     when '0' then 0
#     when '1' then 1
#     when '2' then 2
#     when '3' then 3
#     when '4' then 4
#     when '5' then 5
#     when '6' then 6
#     when '7' then 7
#     when '8' then 8
#     when '9' then 9
#     end
#   end
#   value = 0
#   digits.each{ |digit| value =10 *value + digit}
#   value
# end

# p convert('1234') 
# p convert('19384')

###### Hexadecimal to decimal

# HEX= {
#   '0' => 0,
#   '1' => 1,
#   '2' => 2,
#   '3' => 3,
#   '4' => 4,
#   '5' => 5,
#   '6' => 6,
#   '7' => 7,
#   '8' => 8,
#   '9' => 9,
#   'a' => 10,
#   'b' => 11,
#   'c' => 12,
#   'd' => 13,
#   'e' => 14,
#   'f' => 15
# }

# def hex_to_int(hex)
#   digits = hex.split('').map do |hex_value|
#       HEX[hex_value.downcase]
#   end
#   p digits.reverse!.reduce{ |sum, digit| sum + digit * (16**(digits.index(digit)))}
# end

# hex_to_int('E7A9')
# hex_to_int('4D9f')

###### Covert String to Signed Number

DIGITS = {
  "0" => 0,
  "1" => 1,
  "2" => 2,
  "3" => 3,
  "4" => 4,
  "5" => 5,
  "6" => 6,
  "7" => 7,
  "8" => 8,
  "9" => 9
}
# def negative? (string_num)
#   string_num[0] == '-'
# end



#  def convert (string)
#   negative_number = negative?(string) 

#   digits = string.delete('+-').split('').map do |string_num|
#      DIGITS[string_num]
#      end
#   value = 0
#   digits.each{ |digit| value =10 * value + digit}
#   negative_number ? value * -1 : value
#  end

### LS answer

# def string_to_signed_integer(string)
#   case string[0]
#   when '-' then -string_to_integer(string[1..-1])
#   else          string_to_integer(string.delete('+'))
#   end
# end
 
# def string_to_integer(string)

#   digits = string.split('').map do |string_num|
#       DIGITS[string_num]
#       end
#   value = 0
#   digits.each{ |digit| value =10 * value + digit}
#   value
# end

#  p string_to_signed_integer('-12')
#  p string_to_signed_integer('+12')

##### CONVERT A NUMBER TO A STRING

# def number_to_string (number)
  
#   number.digits.reverse.join('')
# end

# p number_to_string(2345)


##### Convert a Signed Number to a String

# ### my answer
# def number_to_string (number)

#   number.digits.reverse.join('')
# end


# def signed_integer_to_string (number)
#   return '0' if number == 0 
#     string = number_to_string(number.abs)
#     number > 0 ? "+" + string : "-" + string 
# end

### LS answer
# DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

# def integer_to_string(number)
#   result = ''
#   loop do
#     number, remainder = number.divmod(10)
#     result.prepend(DIGITS[remainder])
#     break if number == 0
#   end
#   result
# end

# def signed_integer_to_string (number)
#   if number >=0 
#     "+#{integer_to_string(number)}" 
#   elsif number< 0 
#     "-#{integer_to_string(-number)}"
#   else "0"
#   end
# end

# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'