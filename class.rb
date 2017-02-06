def multiply(isbn_num)
	isbn_values = []
	isbn_array = isbn_num.split('')
	isbn_array.each_with_index [value, index]
	while index < 9 # until it hits 9 it iterates
		value.to_i * (index + 1)
	end

end
