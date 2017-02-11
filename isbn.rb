def valid_isbn?(isbn_num) # ? passing a string to get a boolean (TorF)
	string_no_dash_or_space = isbn_remove_spaces_dashes(isbn_num)
		if valid_isbn_length?(string_no_dash_or_space)
			true
		else
			false
		end
	# check_for_letters(isbn_remove_spaces_dashes)
	# check_for_x_last(check_for_letters)
	# check_for_symbol()
	# compare_remain_to_check(isbn_num)

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
	# OR isbn_num.delete!(' ' '-') # (!) after delete makes it perminent
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
		false
	else
		true
	end
end	

def isbn_array(isbn_num)
	isbn_array = isbn_num.split(//) # splits the string to create an array of individual numbers ["1", "2", etc]
end

def multiply_10(isbn_num)
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

def remainder(sum)
	sum % 11
end

def compare_remain_to_check(isbn_num)
	isbn_value = multiply_10(isbn_num) # created a variable of the multiply function in which we pass the isbn number
	isbn_total = sum(isbn_value) # created a variable for the sum function in which we have to pass the newly created variable isbn_value through
	isbn_mod = remainder(isbn_total) # created a variable for the remainder function in which we are passing the newly created isbn_total function: now all of our functions are runnning under the function compare_remain_to_check function

		if isbn_mod == 10 && isbn_num[-1].match(/[xX]/)
			true
		elsif
			isbn_num[-1].to_i == isbn_mod
				true
		else
			false
		end

end

def valid_isbn_13?(isbn_num) # takes a string and returns a boolean
	# isbn13_array = isbn_num.split('')
	# array13_index = []
	# isbn13_array.each do |index|
	# array13_index << index.to_i
	# end
	#OR 1 line to do the work of the four above
	isbn13_array = isbn_num.split('').map(&:to_i)
	sum = 0
	check_digit = 0
		isbn13_array.each_with_index do |value, index|
			break if index == 12
			if index % 2 == 0 
				sum += value * 1
			else
				sum += value * 3
			end
		end
	sum = sum % 10
	check_digit = 10 - sum
		if check_digit == 10
			check_digit = 0
		end 
	isbn13_array[12] == check_digit		

end
