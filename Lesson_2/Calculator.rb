require 'yaml'

MESSAGES = YAML.load_file('calculator_config.yml')

LANGUAGE = 'jap'

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end


def prompt (key)
  message = messages(key, LANGUAGE)
  puts "=> '#{message}'"
end

def valid_number? (number)
  number.to_i.to_s == number || number.to_f.to_s == number 
end

def valid_calculation? (calc)

   calc == "add" || calc == "subtract" || calc == "multiply" || calc == "divide"
    
end


prompt('welcome')
name = gets.chomp!
loop do
  if name.empty?
    prompt("invalid_name")
  else break
  end
end
prompt('greeting')

number_1 = ''
number_2 = ''
calculation = ''

loop do
loop do 
  loop do
    prompt('enter_integer')
    number_1 = gets.chomp
    number_2 = gets.chomp
    if valid_number?(number_1)  && valid_number?(number_2)
      number_1 = number_1.to_i
      number_2 = number_2.to_i
      break
    else prompt('invalid_entry')
    end
  end 

  loop do 
    prompt('calc_prompt')
    calculation = gets.chomp.downcase
    if !valid_calculation?(calculation)
      prompt('invalid_entry')
    else break
    end
  end
  break
end

def calculation (num1, num2, calc)
  case calc
  when "add"
    puts "#{num1} + #{num2} = #{num1+num2}"
  when "subtract"
    puts "#{num1} - #{num2} = #{num1-num2}"
  when "multiply"
    puts "#{num1} * #{num2} = #{num1*num2}"
  when "divide"
    num1= num1.to_f
    num2= num2.to_f
    puts "#{num1} / #{num2} = #{num1 / num2}"
  end
end

calculation(number_1, number_2, calculation)

prompt('again?')
repeat = gets.chomp.downcase
break unless repeat.start_with?('y')

end



prompt('goodbye')
