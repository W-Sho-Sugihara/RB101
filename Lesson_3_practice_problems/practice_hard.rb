###### Q3

#A
# def mess_with_vars(one, two, three)
#   one = two
#   two = three
#   three = one
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#B
# def mess_with_vars(one, two, three)
#   one = "two"
#   two = "three"
#   three = "one"
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

#C
# def mess_with_vars(one, two, three)
#   one.gsub!("one","two")
#   two.gsub!("two","three")
#   three.gsub!("three","one")
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"

###### Q4

def is_an_ip_number?(string)
  string.to_i >=0 && string.to_i <= 255
end

def dot_separated_ip_address?(input_string)
  return false unless input_string.split('.').size == 4
  
  input_string.split('.').all? { |word| is_an_ip_number?(word)}
end

### LS Answer 
# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false unless dot_separated_words.size == 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     return false unless is_an_ip_number?(word)
#   end

#   true
# end
p dot_separated_ip_address?("12.22.22.22")
p dot_separated_ip_address?("12.22.2222")
p dot_separated_ip_address?("12.22.22.2099")
p dot_separated_ip_address?("12.22.22.22.98")