len [] = 0
len list = 1 + len (tail list)

multiply_over_list list numbers_left
	| len list == 0	|| numbers_left == 0	= 1
	| otherwise 							= (head list) * (multiply_over_list (tail list) (numbers_left - 1))


find_largest_product input_list prod_size
	| prod_size > len input_list 		= 0
	| len input_list == 0				= 0
	| otherwise 						= max (multiply_over_list input_list prod_size) (find_largest_product (tail input_list) prod_size)
	

number_to_list number
	| number == 0 			= []
	| otherwise 			= number_to_list (quot number 10) ++ [number `mod` 10]

-- answer: 23514624000
solve_p8 number prod_size = find_largest_product (number_to_list number) prod_size