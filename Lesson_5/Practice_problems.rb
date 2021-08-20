#### -----------1-------------

# arr = ['10', '11', '9', '7', '8']
# arr.sort!{ |a, b| b.to_i <=> a.to_i}
# p arr

#### -----------2----------------

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# books.sort_by! { |book| book[:published]}
# p books

####------------3------------------

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# p arr1[2][1].last

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# p arr2[1][:third].first

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# p arr3[2][:third][0][0]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# p hsh1['b'][1]

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p hsh2[:third].key(0)

####-------------4-----------------------

# arr1 = [1, [2, 3], 4]

# arr1[1][1]=4
# p arr1

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# arr2[2]=4
# p arr2

# hsh1 = {first: [1, 2, [3]]}

# hsh1[:first][2][0]=4
# p hsh1

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# hsh2[['a']][:a][2]= 4
# p hsh2

####---------------5--------------------------

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# p munsters.map { |member|
#   member[1]['gender'] =='male' ? member[1]['age'] : 0}.sum

# male_ages =[]
# munsters.each do |member, value|
#   male_ages << value['age'] if value['gender']=='male'
# end
# p male_ages.sum

# total_male_ages =0
# munsters.each_value do |details|
#   total_male_ages += details['age'] if details["gender"]=='male'
# end

# p total_male_ages


#-----------------------6----------------_______----____--_--_--__

# munsters.each do |name, details|
#   puts "#{name} is a #{details['age']}-year old #{details['gender']}."
# end 

#------------------------8------_---___--_-_-____--__--_-_-_-_-_-__-_-_--_-__-_-_----_-

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each_value do |arr| 
#   puts arr.map {|string| string.delete('^aeiou')}
# end

# VOWELS = 'aeiou'
# hsh.each do |_, value|
#   value.each do |string|
#     string.chars.each do |letter|
#       puts letter if VOWELS.include?(letter)
#     end
#   end
# end

#-------------------------9-------________________________________________-_-_---

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# p arr.map { |sub_arr|
#   sub_arr.sort { |a,b| 
#     b <=> a 
#   }
# }
# p arr.map do |sub_arr|
#   sub_arr.sort do |a, b|
#     b <=> a
#   end
# end

#-------------------------10--------------- ----- - - - - - - -

# new_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash| 
#   hash.each do |k,v|
#     hash[k]= v+1
#   end
# end
# p new_array

#------------------------11-----------------------------

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# new_arr = arr.map do |sub_arr|
#   sub_arr.select do |num|
#     num%3 ==0
#   end
# end
# p new_arr

#----------------------12-----------------------------------

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

# new_hash = arr.each_with_object({}) { |(key, value), hsh| hsh[key] = value}
# p new_hash

# new_hash2 ={}
# arr.each{|(key,value)| new_hash2[key] = value}
# p new_hash2

#-------------------------13----------------------------------

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# p arr.sort_by {|sub_arr| sub_arr.select{|num| num.odd?}}

#-------------------------14------------------------------------

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# new_hash= hsh.map do |(_, value)| 
#   if value[:type] == 'fruit'  
#     value[:colors].map{|color|color.capitalize}
#   elsif value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end
# p new_hash

#----------------------15----------------------------------------

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# new_arr = arr.each_with_object([]) do |sub_hsh, new_arr|
#   new_arr<< sub_hsh if 
#   sub_hsh.values.flatten.select { |num| num.odd?}.size == 0 
# end

# p new_arr

#----------------------16--------------------------------------------

require 'securerandom'

def generate_uuid1 ()
  sections= [8,4,4,4,12]
  sections.map {|num| SecureRandom.hex(num/2)}.join('-')
end
p generate_uuid1()

HEXADECIMAL = {
  0=> '1',
  1=> '2',
  2=> '3',
  3=> '4',
  4=> '5',
  5=> '6',
  6=> '7',
  7=> '8',
  8=> '9',
  9=> '0',
  10=> 'a',
  11=> 'b',
  12=> 'c',
  13=> 'd',
  14=> 'e',
  15=> 'f' 
}
def generate_random_uuid_component (sequence_length)
  sequence_string=''
  sequence_length.times { sequence_string << HEXADECIMAL[rand(16)]}
  sequence_string
end

def generate_uuid ()
  sections = [8,4,4,4,12]
sections.map { |num| generate_random_uuid_component(num) }.join('-')
end
p generate_uuid()

p SecureRandom.uuid()