##### Selecttion and Transformation

# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }

# def select_fruit (hash)
#   fruit ={}
#   hash.each { |key, value| fruit[key] = value if value == "Fruit" }

#   fruit
# end


# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

####_____________________________

# def double_numbers!(numbers)
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     numbers[counter] *= 2

#     counter += 1
#   end
#   numbers
# end
# n=[1,2,3,4,5,6]
# double_numbers!(n)
# p n

#_______________________________

# def double_odd_numbers(numbers)
#   doubled_numbers = []
#   counter = 0

#   loop do
#     break if counter == numbers.size

#     current_number = numbers[counter]
#     current_number *= 2 if numbers.index(current_number).odd?
#     doubled_numbers << current_number

#     counter += 1
#   end

#   doubled_numbers
# end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)

######_________________________

def multiply(numbers, multiplier)
  counter = 0
  multiplied_outcomes =[]

  loop do
    break if counter == numbers.size

    multiplied_outcomes << numbers[counter] * multiplier

    counter += 1
  end
  multiplied_outcomes
end