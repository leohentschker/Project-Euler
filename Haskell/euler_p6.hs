sum_over_squares number
	| number == 1			= 1
	| otherwise				= number * number + sum_over_squares (number - 1)

natural_sum number
	| number == 0			= 0
	| otherwise 			= number + natural_sum (number - 1)

solve_p6 number = natural_sum (number) * natural_sum (number) - sum_over_squares number