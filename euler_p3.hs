get_top_prime remainder cur_val
        | remainder == 1                    = cur_val
        | remainder `mod` cur_val == 0      = get_top_prime (quot remainder cur_val) (cur_val)
        | otherwise                         = get_top_prime remainder (cur_val + 1)

solve_p3 num = get_top_prime num 2
