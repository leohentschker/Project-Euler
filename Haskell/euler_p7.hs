sieve_list number list
	| list == []						= []
	| (head list) `mod` number == 0		= sieve_list number (tail list)
	| otherwise 						= [head list] ++ sieve_list number (tail list)


prime_list natural_numbers
	| natural_numbers == []				= []
	| otherwise 						= [head natural_numbers] ++ prime_list (sieve_list (head natural_numbers) (tail natural_numbers))

-- answer: 104743
solve_p7 prime_index = (prime_list [2..]) !! (prime_index - 1)