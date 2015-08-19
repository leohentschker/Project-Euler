sieve_list number list
	| list == []						= []
	| (head list) `mod` number == 0		= sieve_list number (tail list)
	| otherwise 						= [head list] ++ sieve_list number (tail list)

prime_list natural_numbers
	| natural_numbers == []				= []
	| otherwise 						= [head natural_numbers] ++ prime_list (sieve_list (head natural_numbers) (tail natural_numbers))

sum_over_list [] = 0
sum_over_list (x:xs) = x + sum_over_list xs

solve_p10 upper_bound = sum_over_list (prime_list [2..upper_bound])

