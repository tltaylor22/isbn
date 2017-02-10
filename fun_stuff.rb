def multiply_13(isbn_num)
isbn_num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
isbn_num.select {|x| x % 2 == 1} * 1 = isbn_13_odd
isbn_num.select {|x| x % 2 == 0} * 3 = isbn_13_even
isbn_13_odd + isbn_13_even = sum
sum % 10 = 

def even_index_locations(isbn_array)
	isbn_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].select {|x| x % 2 == 0}
end # will give you the odd integers

def even_index_locations(isbn_array)
	isbn_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13].select {|x| x % 2 == 1}
end # will give you the even integers

def even_index_locations(isbn_array)
	isbn_13_even = isbn_array.values_at(* isbn_array.each_index.select {|i| i.even?})
end

def odd_index_locations(isbn_array)
	isbn_13_odd = isbn_array.values_at(* isbn_array.each_index.select {|i| i.odd?}) 
end

# the above will index even and odd position in the array

