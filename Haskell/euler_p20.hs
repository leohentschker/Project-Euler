factorial 1 = 1
factorial num = num * factorial(num - 1)

sum_digits 0 = 0
sum_digits number = number `mod` 10 + sum_digits (quot number 10)

solve_p20 number = sum_digits (factorial number)