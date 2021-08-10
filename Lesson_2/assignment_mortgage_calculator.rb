# Casual 
# obtain loan amount, APR, and Loan duration(years).
# convert apr to monthly interest rate
# convert loan duration to months

# method = algorithm to calculate monthly payments

# Formal

# Set = loan amount, APR, and Loan duration(years)

# Get = loan amount, APR, and Loan duration(years)

# convert loan duration to months
# convert apr to monthly interest rate

# monthly payment = loan_amount * (monthly_interest_rate / (1 - (1+ monthly_interest_rate)**(-loan_duration_in_months)))

# return monthly payment



def prompt(message)
  puts "=> #{message}"
end

def input_request (input)
  puts "=>Please enter desired #{input}."
end

def verify_integer(int)
  int.to_i.to_s == int || int.to_f.to_s == int && int > 0
end

def convert_to_months(years)
  years * 12
end

def loan_calc(loan_amount, monthly_interest_rate, loan_duration_in_months)
  loan_amount * (monthly_interest_rate / (1 - (1+ monthly_interest_rate)**(-loan_duration_in_months)))
end


prompt('Welcome to the mortgage calculator!')

loan_amount =nil
loop do 
  input_request("loan amount")
  loan_amount = gets.chomp
  if verify_integer(loan_amount)
    loan_amount = loan_amount.to_f
    break
  else prompt('Please enter a valid positive integer.')
  end
end

apr = nil
loop do 
  input_request("APR")
  apr = gets.chomp
  if verify_integer(apr)
    apr = Float(apr)/100
    
    break
  else prompt('Please enter a valid positive integer.')
  end
end

loan_duration_in_years = nil
loop do 
  input_request("loan duration in years")
  loan_duration_in_years = gets.chomp
  if verify_integer(loan_duration_in_years)
    loan_duration_in_years = loan_duration_in_years.to_f
    
    break
  else prompt('Please enter a valid positive integer.')
  end
end

loan_duration_in_months = convert_to_months(loan_duration_in_years)

monthly_interest_rate = apr/loan_duration_in_months

monthly_payment = loan_calc(loan_amount, monthly_interest_rate, loan_duration_in_months)

prompt("Your monthly payments will be $#{monthly_payment}.")

prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")