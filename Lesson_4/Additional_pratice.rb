##### 1

# input: array
# output: new hash
# rules:
    #turn array into hash
    #elements in array each become key in new hash
    #value of eack key is its index in the input array
    
## Algorithm
  #create empty hash
  #iterate over array elements
    #each element set to new hash key (with its index being the new value)
  #each new keys' value set to corrisponding array elements' index
  #return new hash

  # flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

  # def elements_with_index(array)
  #   hash_with_elemets_and_index={}
  #   count = 0
  #   loop do
  #     break if count == array.length

  #     hash_with_elemets_and_index[array[count]]= count
  #     count+=1
  #   end
  #   hash_with_elemets_and_index
  # end

# def elements_with_index(array)

#   array.each_with_object({}) {|el, hash| hash[el] = array.index(el)}
# end

#   p elements_with_index(flintstones)

####### -----#2-----------________---____---___---___--__--__-__--____--_----_-________-_-_--_-

# input: hash
# output: integer
# rules:
  #sum of the values in ages hash
  #return sum

# Algorithm
  # store all values of ages hash in array
  # sum all values in new array
  # return sum 

  # ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

  # def sum_of_values (hash)
  #   hash.values.sum
  # end

  # p ages.values.inject(:+)
  # p sum_of_values(ages)

  ######--------#3---------------____---____---____--__-__-_-___-----__---___-_-_
# Input: hash
# output: mutated hash
# rules:
  # remove key:value pairs whos values are greater or equal to 100
  # return updated hash

# Algorithm
  #iterate over key:value pairs
  #check if values is >= 100
  #if greater or equal then remmove from hash
  #return updated hash

#   ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 442, "Eddie" => 10 }

# def less_than_100! (hash)
#   hash.select! { |key, value| value < 100}
# end

# p less_than_100!(ages)
# p ages

#####-------#4---------------------__--_-_-_--_--_--____----_-----_____-____-___

# Input: hash
# output: integer
# Rules:
  #return value in hash which has the lowest value
  # in case of tie return single integer of said value

# Algorithm
  #create empty variable current lowest value 
  # add first value in hash as current lowset value
  #iterate through values in given hash
  #compair iterated values with stored current lowest value
  #if iterated value is lower replace current lowest value with current iterated value
  #if not lower do not replace and move on to next iterated value
  #when all values have been compaired remaining current lowest value will be returned
  
  # ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

  # p ages.values.reduce{ |current_lowest, current_value| current_lowest > current_value ? current_lowest = current_value : current_lowest}


  # def lowest_age?(hash)

  #   ages = hash.values
  #   current_lowest = ages.first

  #   ages.each{|age| current_lowest = age if current_lowest>age }
  #   current_lowest
  # end

  # p lowest_age?(ages)

####------#5---------------------______-_---_--____--____-__-__--__-___---__--_-----
# Input: array
# Output: index number
# rules:
  #return the first name starting with 'Be'(case sensitive)
  #return "No names found starting with 'Be'."


# Algorithm
  #iterate over array and store the first 2 letters of each value in a new array
  #iterate over new array and search for the first instance of 'Be'
  #return its index if found
  #if not found return "No names found starting with 'Be'."

  # flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

  # def index_of_first_name_starting_with_Be (array)
  #   index_number = array.map{ |name| name[0,2]}.index("Be")
  #   index_number ? index_number : "No names found starting with 'Be'."
  # end

  # p index_of_first_name_starting_with_Be(flintstones)

  #####---------#6-------------------_____----______-----__---_--___-__-__-

# Input: array
# Output: mutated array
# Rules:
  # each string in array is shortened to the first three letters of self
  
# Algorithm
  #iterate through each value in array
  #replace iterated value with only its leading 3 characters

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#-------my original version-------
# def three_letters_only (array)
#   array.each_with_index{|name, index| array[index] = name[0..2]}
# end

#------LS answer adapted--------
# def three_letters_only (array)
#   array.map!{|name| name[0..2]}
# end

# p three_letters_only(flintstones)
# p flintstones

#-----------#7--------------____--___--__--___-~~~~~~~~``~~~`~~~~~~~~~~~~____---___-

#Input: string
#Output: new hash
#Rules:
  #counts how many instances of each letter are used within the string (case sensitive) into a hash
  # the hash is organized aphabetically
  #capitalized letters first then lowercase within hash

# Algorithm
  #create empty hash
  #iterate through string
  #check if value has been counted yet in hash
    #if not create new key and count of 1
    #if so add to count
  #organize hash aphabetically

# statement = "The Flintstones Rock"

# def letter_instances (string)

#   unsorted_hash = string.delete(' ').chars.each_with_object({}) { |letter, hash| hash[letter] ? hash[letter] +=1 : hash[letter] = 1}
#   sorted_hash = unsorted_hash.sort.to_h

# end

# p letter_instances(statement)

#------------#9------------------__________----_____---_--_-_-_-_----__-_--_---_-__-_--__-__--_---_-
#input: string
#output: updated string
#Rules:
  #capitalize each word in given string

# Algorithm
  #split string if larger than one word
  #capitalize each word
  #join array to recreate string but now capitalized
  #replace old string wtih updated string

  # words = "the flintstones rock"

  # def titleize(string)
  #   string.replace(string.split(' ').map!{ |word| word.capitalize}.join(' '))
  # end

  # p titleize(words)
  # p words

#----------------#10----------_--_--_--_-_---_-_------_--_------__--_-_-_-_-_----_-_-_-_
#input: hash
#output: updated hash
#Rules: 
  #age_group category is added to each subhash
  #age_group is defined as: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
  
# Algorithm
  #iterate through each subhash
  #iterate though subhash and compare age to the age_group rule
  # add new age_group key with appropriate age_group value
  #return updated hash

def add_age_group(family)
  family.each_key do |member|
    p family[member]['age']
    case 
    when family[member]['age']<=17 then family[member]['age_group'] = 'kid'
    when family[member]['age'] >17 && family[member]['age']<65 then family[member]['age_group'] = 'adult'
    when family[member]['age'] >+65 then family[member]['age_group'] = 'senior'
    end
  end
end

  munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
p add_age_group(munsters)
munsters
