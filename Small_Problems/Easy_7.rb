##------------Combine Two Arrays_---------------------------

#input: two arrays
#:output new array
#Rules:
  #New array contains a combination of both arrays
  #values from both arrays are ordered interchangingly in the new array
  #input arrays will have same number of values

#Algorithm
  #method takes two arguments
  #create new empty array
  #iterate through first input and add values to new array if new array index is even.
  #iterate through second input array and add values to new array if index of new array is odd.
  #return new array


# def interleave (arr1, arr2)
#   new_array=[]
#   loop do 
#     new_array << arr1.shift << arr2.shift
#     break if arr1.empty? && arr2.empty?
#   end
#   new_array
# end

# def interleave (arr1,arr2)
#   arr1.each_with_object([]) {|value, new_array| new_array << value << arr2.shift}
# end

# def interleave (arr1, arr2)
#   results = arr1.zip(arr2).flatten
# end
# def interleave (arr1, arr2)
#   [arr1,arr2].transpose.flatten
# end


# p interleave([1,2,3],['a','b','c'])

#----------------Lettercase Count-----------------------
#input: string
#output: hash
#rules:
  #keys are uppercase count, lowercase count and neither count
  #values are integers of the count number of occurances of :keys withing string
  #return hash
  
#Algorithm
  #new method takes string
  #hard code keys, values will take input argument
  #values: delete all other than what the key is looking for then measure length

# def letter_case_count(string)
#   hsh = {
#     uppercase: string.delete('^a-z').size,
#     lowercase: string.delete('^A-Z').size,
#     neither: string.delete('a-zA-Z').size
#   }
# end

# p letter_case_count('abCdef 123')
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

#-------------Capitalize Words------------_______-----___________---__-________
#input: string
#output: new string
#rules:
  #assume input includes no blanks
  #capitalize the first letter of each word in the given string and return a new string

#Algorithm
  #string split at whitespace, 
  # iterate through array and String#capitalize
  #join array and return

# def word_cap (string)
#   string.split(' ').map{ |word| word.capitalize}.join(' ')
# end

#__________further exploration___________________

# def word_cap(string)
#   new_string= string.split(' ').map do |word| 
#     word[0].upcase + word[1...word.size].downcase
#   end
#   new_string.join(' ')
# end

# def word_cap(string)
#   string.split.map {|word| 
#     word.split('').each_with_object('').with_index { |(letter, new_word), index| 
#     index ==0 ? new_word << letter.upcase : new_word<< letter.downcase}
#     }.join(' ')
  
# end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

#----------------Swap Case-------------------------
#input: string
#output: new string
#rules:
  #upcase lowercase letters
  #downcase uppercase letters
  #do not change nonletters
  #do not use #swapcase

#Algorithm
  #iterate through string and upcase if lowercase and downcase if uppercase ignore non letters
  #return new string

# def swapcase (string)
#   new_string=''
#   string.each_char do |letter|  
#     letter.upcase == letter ? 
#     new_string << letter.downcase : 
#     new_string << letter.upcase
#   end
#   new_string
# end

# p swapcase('abcd BBNhNh asj asjdJShKSKJDKJs ')
# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#---------------Staggered Case------------------------
#input: string
#output: new string
#Rules: 
  #all even index's are capitalized, including whitespace in index

# def staggered_case(string)
#   string.chars.each_with_object('').with_index do |(letter, new_string), index| 
#     index.even? ? 
#     new_string<< letter.upcase : 
#     new_string<< letter.downcase
#   end
# end
# p staggered_case('I Love Launch School!') #== 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') #== 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'

#-------------Staggered Case part2------______-__--_--_-__-_--_-_-
#input: string
#output:new string
#Rules:
  #everyother letter is capitalized, non-letters not counted 

#Algorithm
  # create empty string
  #create boolean toggle variable
  #split string including spaces and nonletters
  #iterate through string-array skipping/ignoring all nonletters
  #using boolean toggle var to upcase or downcase every other letter and << to empty new string
  #return new string

# def staggered_case (string, ignore_whitespace = true)
#   new_string =''
#   upper_case = true
#   string = string.chars
#   if ignore_whitespace == true
#     string.each do |letter|
#       if letter =~ /[a-zA-Z]/
#         case upper_case
#         when true
#           new_string<< letter.upcase 
#         when false
#           new_string<< letter.downcase
#         end
#         upper_case = !upper_case
#       else new_string<<letter
#       end
#     end
#   elsif ignore_whitespace == false 
#     string.each_with_index do |letter, index| 
#     index.even? ? 
#     new_string<< letter.upcase : 
#     new_string<< letter.downcase
#     end
#   end
# new_string   
# end

# p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

#-------------Multiplicative Average____________________---------------
#input: array of integers
#outputs: results
#rules:
  # multipy all values in array
  #divide product by array size
  #round results to 0.000

#Algorithm
  #change ntegers to floats
  #reduce array to product
  #divide product by input array size
  #round to 0.000

# def show_multiplicative_average(array)
#  format('%0.3f' ,array.reduce{ |sum,num| sum * num.to_f} / array.size.round(3))
  
# end

# p show_multiplicative_average([3, 5])                # => The result is 7.500
# p show_multiplicative_average([6])                   # => The result is 6.000
# p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
#---------------------Multiply lists_---__-_______----__-___
#input: 2 arrays
#output: 1 new array
#rules:
  # multiply the values with the same index, product >> to new array

#Algorithm
  #use #each_with_object & #with_index 

# def multiply_list(arr1,arr2)
#   arr1.each_with_object([]).with_index { |(value, new_arr), index| new_arr << value * arr2[index]}
# end

# def multiply_list(arr1,arr2)
#   new_arr = arr1.zip(arr2).map{|sub_arr| sub_arr.reduce(&:*)}
  
# end

# p multiply_list([3, 5, 7], [9, 10, 11])

#----------------Multiply all Pairs______________________--
#input: 2 arrays
#output: 1 array 
#rules:
  #multiply the values of both arrays in all possible combinations
  #resulting new array should be sorted from smallest

#Algorithm
  #for each value in first array mulitply it with all values in second array and store in new array

# def multiply_all_pairs (arr1, arr2)
#   results =[]
#   arr1.each do |value1|
#     arr2.each do |value2|
#       results << value1 *value2
#     end
#   end
#   results.sort
# end
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

#--------------------The End is Near___________________--------
#input: string
#output: new string
#Rules: 
  # return the second to last word

#Algorithm
  
# def penultimate(string)
#   string.split[-2] ? string.split[-2] : ''
# end
# p penultimate('last word') #== 'last'
# p penultimate('Launch School is a great!') #== 'is'
# p penultimate('') #== 'is'
# ------further exploration-------
#Rules: ignore nonletters and whitespace, single letter words still count, if even number of words retrun middle two words, returns empty is input is empty

# def penultimate(string)
#   array_words = string.delete("^a-zA-Z", "^' '").split(' ')
#   middle_word = array_words[array_words.size / 2]
#   if array_words.size.odd? 
#     middle_word
#   else middle_word = array_words[(array_words.size / 2)-1] + ' & ' +middle_word
#   end
# end

# p penultimate('zero one, two three four five ') 


customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

# all_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
#   {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
#   # rest of data
# ]

# fulfilled_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
#   {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
#   # rest of data
# ]

fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
   if order[:order_fulfilled]
    total + order[:order_value] 
   else total
   end
  end

  fulfilled_orders[index][:order_value] = order_value
end

p fulfilled_orders