is_palindrome input = reverse input == input

num_is_palindrome num = is_palindrome(show num)

check_palindromes product
	| num_is_palindrome(product) == True 		= product
	| otherwise									= -1

cycle_through_vals val1 val2 low_bound top_bound
	| val2 == low_bound			 				= cycle_through_vals (val1 - 1) top_bound low_bound top_bound
	| val1 == low_bound    						= []
	| check_palindromes(val1 * val2) == -1 		= cycle_through_vals val1 (val2 - 1) low_bound top_bound
	| otherwise									= (cycle_through_vals val1 (val2 - 1) low_bound top_bound) ++ [val1 * val2]

all_palindromes low_bound top_bound = cycle_through_vals top_bound top_bound low_bound top_bound

solve_p4 low_bound top_bound = maximum (all_palindromes low_bound top_bound)

