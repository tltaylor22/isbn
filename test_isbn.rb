require 'minitest/autorun'
require_relative 'isbn.rb' 


class TestISBN < Minitest::Test 

	def test_1_equal_1
		assert_equal(1,1)
	end
	
	def test_number_is_10_digits_true
		isbn_num = '1234567890'
		assert_equal(true, valid_isbn_length?(isbn_num))
	end
	
	def test_number_is_9_digits_false
		isbn_num = '123456789'
		assert_equal(false, valid_isbn_length?(isbn_num))
	end	

	def test_number_is_13_digits_true
		isbn_num = '1234567890123'
		assert_equal(true, valid_isbn_length?(isbn_num))
	end	

	def test_remove_spaces
		isbn_num = '123 4 5 67890'
		assert_equal('1234567890', isbn_remove_spaces_dashes(isbn_num))
	end

	def test_include_all_nums_inside_string_false
		isbn_num = '12345-67890'
		assert_equal('1234567890', isbn_remove_spaces_dashes(isbn_num))
	end

	def test_check_for_letters_false
		isbn_num = '123m456D7890'
		assert_equal(false, check_for_letters(isbn_num))
	end

	def test_if_x_must_be_at_the_end_true
		isbn_num = '1234567890x'
		assert_equal(true, check_for_x_last(isbn_num))
	end

	def test_if_x_must_be_at_the_end_false
		isbn_num = '123456789$'
		assert_equal(false, check_for_x_last(isbn_num))
	end

	def test_check_for_symbol_true
		isbn_num = '123;456$7890'
		assert_equal(true, check_for_symbol(isbn_num))
	end

	def test_check_for_symbol_false
		isbn_num = '1234567890'
		assert_equal(false, check_for_symbol(isbn_num))
	end

	def test_check_for_symbol_false_short
		isbn_num = '123456W'
		assert_equal(false, check_for_symbol(isbn_num))
	end

	# def test_valid_number_or_X_position_false
	# 	isbn_num = '1234567890'
	# 	assert_equal(false, check_valid_number_or_X_position(isbn_num))
	# end

	# def test_valid_number_or_X_position_true
	# 	isbn_num = '1234$6789'
	# 	assert_equal(true, check_valid_number_or_X_position(isbn_num))
	# end

	def test_isbn_is_array_of_individual_numbers
		isbn_num = '123456789'
		assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9"], isbn_array(isbn_num))
	end

	def test_multiply_string_by_position
		results = multiply('123456789')
		assert_equal([1, 4, 9, 16, 25, 36, 49, 64, 81], results)
	end

end	
