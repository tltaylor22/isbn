require 'minitest/autorun'
require_relative 'isbn.rb' 


class TestIsbn < Minitest::Test 

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

	def test_number_is_13_digits_false
		isbn_num = '1234567890123X'
		assert_equal(false, valid_isbn_length?(isbn_num))
	end	

	def test_remove_spaces_10
		isbn_num = '123 4 5 67890'
		assert_equal('1234567890', isbn_remove_spaces_dashes(isbn_num))
	end

	def test_remove_spaces_13
		isbn_num = '123 4 5 67890 234'
		assert_equal('1234567890234', isbn_remove_spaces_dashes(isbn_num))
	end

	def test_remove_dashes_10
		isbn_num = '12345-67890'
		assert_equal('1234567890', isbn_remove_spaces_dashes(isbn_num))
	end

	def test_remove_dashes_13
		isbn_num = '12345-67890-234'
		assert_equal('1234567890234', isbn_remove_spaces_dashes(isbn_num))
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
		assert_equal(false, check_for_symbol(isbn_num))
	end

	def test_check_for_symbol_false
		isbn_num = '1234567890'
		assert_equal(true, check_for_symbol(isbn_num))
	end

	def test_check_for_symbol_false_short
		isbn_num = '123456W'
		assert_equal(true, check_for_symbol(isbn_num))
	end

	def test_isbn_is_array_of_individual_numbers
		isbn_num = '123456789'
		assert_equal(["1", "2", "3", "4", "5", "6", "7", "8", "9"], isbn_array(isbn_num))
	end

	def test_multiply_string_by_position
		results = multiply_10('123456789')
		assert_equal([1, 4, 9, 16, 25, 36, 49, 64, 81], results)
	end

	def test_add_value_index_totals
		results = sum([1, 2, 3, 4, 5, 6, 7, 8, 9])
		assert_equal(45, results)
	end

	def test_return_mod_11_0
		results = remainder(11)
		assert_equal(0, results)
	end
	
	def test_return_mod_11_1
		results = remainder(232)
		assert_equal(1, results)
	end

	def test_if_remainder_equals_checkdigit_true
		results = compare_remain_to_check('877195869x')
		assert_equal(true, results)
	end

	def test_if_remainder_equals_checkdigit_false
		results = compare_remain_to_check('877&95869x')
		assert_equal(false, results)
	end
	
	def test_if_remainder_equals_checkdigit_true2
		results = compare_remain_to_check('0132971291')
		assert_equal(true, results)
	end

	def test_if_remainder_equals_checkdigit_false2
		results = compare_remain_to_check('877&958x')
		assert_equal(false, results)
	end
end

class TestIsbn13 < Minitest::Test

	def test_mod_11_equals_1
		results = remainder(12)
		assert_equal(1, results)
	end

	def test_remainder_equals_checkdigit_true
		results = compare_remain_to_check('877195869x')
		assert_equal(true, results)
	end

	def test_remainder_equals_checkdigit_false
		results = compare_remain_to_check('877&95869x')
		assert_equal(false, results)
	end

	def test_valid_isbn_13
		isbn13 = '978-1-56619-909-4'
		assert_equal(true, valid_isbn_13?(isbn13))
	end
end

