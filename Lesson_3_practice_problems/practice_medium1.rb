##### Q1
title = "The Flintstones Rock!"

# 10.times do |num|
#   puts title.rjust(title.size + num)
  
# end

###### Q2

# puts "the value of 40 + 2 is " + (40 + 2).to_s
# puts "the value of 40 + 2 is #{40 + 2}"

###### Q3

# def factors(number)
#   divisor = number
#   factors = []
        # if number > 0
        #   loop do
        #     factors << number / divisor if number % divisor == 0
        #     divisor -= 1
        #     break if divisor == 0
        #   end  
        # end
# while divisor > 0 
#   factors << number / divisor if number % divisor == 0
#   divisor -= 1
# end

#   factors
# end

# puts factors(10)
# puts factors(0)
# puts factors(-20)

##### Q5



# def fib(first_num, second_num, limit)
#   while first_num + second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end

# result = fib(0, 1, 15)
# puts "result is #{result}"


##### Q7

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  new_hash = demo_hash
  new_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

puts munsters


###### Q8

puts rps(rps(rps("rock", "paper"),     rps("rock", "scissors")),             "rock")