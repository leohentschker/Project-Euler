euler_p1 :: Int -> Int
euler_p1 0 = 0
euler_p1 x
        | x `mod` 3 == 0 || x `mod` 5 == 0 = x + euler_p1 (x - 1)
        | otherwise                        = euler_p1 (x - 1)
solve_p1 num = euler_p1 (num - 1)