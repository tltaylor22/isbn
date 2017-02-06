def valid_isbn?(isbn_num) # ? passing a string to get a boolean (TorF)
valid_isbn_length(isbn_num)
isbn_remove_spaces_dashes(isbn_num)
check_for_letters(isbn_num)
check_for_x_last(isbn_num)
end

def valid_isbn_length?(isbn_num)
	if isbn_num.length == 10 || isbn_num.length == 13
		true
	else
		false
	end	
end

def isbn_remove_spaces_dashes(isbn_num)
	isbn_num.gsub(/[ -]/, '') # a regex to sub out spaces and dashes 
	# OR isbn_num.delete(' ' '-') # (!) after delete makes it perminent
end

def check_for_letters(isbn_num)
	if isbn_num.chop.match(/[a-zA-Z]/) # checking to match lower and upper case letters in the string
		false
	else
		true
	end
end	

def check_for_x_last(isbn_num)
	if isbn_num[-1].match(/[0-9xX]/) # checking that a number or x (lower or upper) are the last element of the string
		true
	else
		false
	end
end	

def check_for_symbol(isbn_num)
	if isbn_num.chop =~ /\D/ # checking to see if there are symbols in the string. \D is the same as [^0-9] (everything except digits) - Not sure if I need to check the 9 spot using the tilde or not???? .chop removes the last digit in the string
		true
	else
		false
	end
end	

# def check_valid_number_or_X_position(isbn_num)
# 	if isbn_num[0..12].match(/\D/) && isbn_num[-1].match(/[0-9xX]/)
# 		true
# 	else
# 		false
# 	end
# end	

def isbn_array(isbn_num)
	isbn_array = isbn_num.split(//) # splits the string to create an array of individual numbers ["1", "2", etc]
end

def multiply(isbn_num)
	isbn_values = []
	isbn_array = isbn_num.split('')
	isbn_array.each_with_index do |value, index|
	if index < 9 # until it hits 9 it iterates
		num = value.to_i * (index + 1)
		isbn_values.push(num)
	end
end
	isbn_values
end

def sum(isbn_array)
	# isbn_array.inject(:+) # adds the sum of integers in our array
	counter = 0 # empty counter
	isbn_array.each do |value| # looping through the array and taking the value of each
	counter += value # OR counter = counter + value - adding each value to the counter
	end # ends the loop
	counter	# returning/calling the counter
end


