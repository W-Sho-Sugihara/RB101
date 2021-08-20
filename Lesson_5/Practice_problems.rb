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

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
new_arr = arr.map do |sub_arr|
  sub_arr.select do |num|
    num%3 ==0
  end
end
p new_arr