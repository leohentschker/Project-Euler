fib_sequence = 1 : 1 : zipWith (+) fib_sequence (tail fib_sequence)

euler_p2 max_val list
	    | head list `mod` 2 == 0 && (head list) < max_val = head list + euler_p2 max_val (tail list)
	    | head list < max_val                             = euler_p2 max_val (tail list)
	    | otherwise                                       = 0

solve_p2 max_val = euler_p2 max_val (take 100 fib_sequence)
