#### 

# def repeat_greeting (greeting, number)
#   number.times{ |_| puts "#{greeting}"}
# end

# repeat_greeting("Hello!", 3)

#### ODD #############

# def is_odd? (num)
#   puts num.remainder(2) == 1
# end

# is_odd?(2)
# is_odd?(5)
# is_odd?(9)
# is_odd?(14)
# is_odd?(-19)
# is_odd?(0)


##### List of Digits ########

# def digit_list (num)
#   p num.to_s.split('').map{ |n| n.to_i}
# end

# digit_list(18736)
# digit_list(1)
# digit_list(18732839566)
# digit_list(2222)

###### How Many? ############

vehicles = [
  'car', 'car', "suv", 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', "TRUCK"
]

##sho's answer

# def count_occurrences1(arr)
#   occurrences ={}

#   arr.each do |i|
#     i = i.downcase.to_sym
    
#     occurrences[i] ? occurrences[i] += 1 : occurrences[i] = 1
#   end

#   occurrences.each_pair do |k, v|
#     puts "#{k} => #{v}"
#   end

# end

## LS answer

# def count_occurrences2(array)
#   occurrences = {}

#   array.uniq.each do |element|
#     element.downcase!
#     occurrences[element] = array.count(element)
#   end

#   occurrences.each do |element, count|
#     puts "#{element} => #{count}"
#   end
# end

# count_occurrences1(vehicles)
# count_occurrences2(vehicles)

###### ReverseIt Pt1 ########

# def reverse_sentence (string)
#   puts string.split(" ").reverse.join(' ')
# end

# reverse_sentence("hello World")
# reverse_sentence('Reverse these words')
# reverse_sentence('')
# reverse_sentence('    ')

###### part 2 ###########

# def reverse_words (string)
#      reversed_words = string.split(' ').map do |word|
#      if word.size >=5 
#        word.split('').reverse.join('') #note use word.reverse! instead
#      else word
#      end
#     end .join(' ')
#    return reversed_words
# end

# p reverse_words('Professional')         
# p reverse_words('Walk around the block') 
# p reverse_words('Launch School')         

###### Stringy Strings #########

# def stringy (number)
#   arr=[]
#   number.times { |i| i.even? ? arr.push(1): arr.push(0)}
#   return arr.join('')
# end

## LS answer
# def stringy (size)
#   numbers = []

#   size.times do |index|
#     number = index.even? ? 1 :0
#     numbers << number
#   end

#   numbers.join
# end

### further exploration
# def stringy (number, op = 1)
#    arr=[]

#    if op != 0 
#     number.times { |i| i.even? ? arr.push(1): arr.push(0)}
#    else number.times { |i| i.even? ? arr.push(0): arr.push(1)}
#   end 

#    return arr.join('')
#  end


#  puts stringy(2) == "10"
#  puts stringy(9, 0)
#  puts stringy(4, 4)
#  puts stringy(7)


####### Array Average#########

# def average (arr)
#   (arr.reduce(:+)/arr.size.to_f)
# end
# puts average([1, 6])
# puts average([1, 5, 87, 45, 8, 8])
# puts average([9, 47, 23, 95, 16, 52])


######### Sum of Digits #########

# def sum (number)
#   number.to_s.split("").reduce { |sum, num| sum.to_i + num.to_i}
#   # number.to_s.chars.map(&:to_i).reduce(:+)
# end

# puts sum(23)
# puts sum(496)
# puts sum(123_456_789)

######## What's my Bonus #########

def calculate_bonus (num, boolean)
  boolean ? num/2: 0
end

puts calculate_bonus(2800, true)
puts calculate_bonus(1000, false)
puts calculate_bonus(50000, true)