check_triplet num1 num2 num3 desired_output
	| num1 + num2 + num3 == desired_output 		= True
	| otherwise 								= False

is_int x
	| x == fromInteger (round x) 	= True
	| otherwise 					= False

get_hypotenuse num1 num2 = sqrt (num1 * num1 + num2 * num2)

check_pythag_triple num1 num2 desired_output
	| is_int (get_hypotenuse num1 num2) == True				= check_triplet num1 num2 (fromInteger (round (get_hypotenuse num1 num2))) desired_output
	| otherwise 											= False

find_tuples num1 num2 min max desired_output
	| num1 > max														= -1
	| num2 > max														= find_tuples (num1 + 1) min min max desired_output
	| check_pythag_triple num1 num2 desired_output == True				= num1 * num2 * (get_hypotenuse num1 num2)
	| otherwise 														= find_tuples num1 (num2 + 1) min max desired_output


solve_p9 desired_output max = find_tuples 1 1 1 max desired_output