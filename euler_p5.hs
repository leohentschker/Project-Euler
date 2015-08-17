-- this is being done for small numbers
-- so non-efficient techniques for determining
-- things like factors are fine

sieve_list number list
	| list == []						= []
	| (head list) `mod` number == 0		= sieve_list number (tail list)
	| otherwise 						= [head list] ++ sieve_list number (tail list)


prime_list natural_numbers
	| natural_numbers == []				= []
	| otherwise 						= [head natural_numbers] ++ prime_list (sieve_list (head natural_numbers) (tail natural_numbers))

is_in_list item list
	| list == [] 		= False
	| head list == item	= True
	| otherwise 		= is_in_list item (tail list)

factor_repeat_list number factor
	| number == 0	|| number `mod` factor > 0		= []
	| otherwise 									= [factor] ++ factor_repeat_list (quot number factor) factor

get_prime_factors number cur_val primes
	| cur_val > number 											= []
	| number `mod` cur_val == 0	&& is_in_list cur_val primes	= factor_repeat_list number cur_val ++ get_prime_factors number (cur_val + 1) primes
	| otherwise 												= get_prime_factors number (cur_val + 1) primes


pop_item list item_to_pop
	| list == []				= []
	| head list == item_to_pop 	= tail list
	| otherwise 				= [head list] ++ pop_item (tail list) item_to_pop

missing_items required_list current_list
	| required_list == [] 							= []
	| is_in_list (head required_list) current_list	= missing_items (tail required_list) (pop_item current_list (head required_list))
	| otherwise										= [head required_list] ++ missing_items (tail required_list) current_list

get_necessary_factors number_list primes current_factor_list
	| number_list == []			= []
	| otherwise 				= missing_items (get_prime_factors (head number_list) 2 primes) current_factor_list ++ get_necessary_factors (tail number_list) primes (current_factor_list ++ missing_items (get_prime_factors (head number_list) 2 primes) current_factor_list)

multiply_over_list number_list
	| number_list == [] 		= 1
	| otherwise 				= (head number_list) * multiply_over_list (tail number_list)


solve_p5 upper_bound = multiply_over_list (get_necessary_factors [1..upper_bound] (prime_list[2..upper_bound]) [])