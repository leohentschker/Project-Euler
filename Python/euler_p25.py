RESULT_CACHE = {}
NUMBER_SIZE = 1000

def fibonacci(n):
    """
    Compute the n-th term of the fibonacci series
    """

    # base cases
    if n == 1:
        return 1

    if n == 0:
        return 0

    # grab from the cache
    existing_result = RESULT_CACHE.get(n)

    if existing_result is not None:

        return existing_result
    else:

        result = fibonacci(n - 1) + fibonacci(n - 2)

        RESULT_CACHE[n] = result
        return result


def determine_fibonacci_index_for_digit_size(digit_size):
    # store what term in the series we are at
    current_index = 1

    while True:
        # compute the fibonacci value of that index
        fib_result = fibonacci(current_index)

        if len(str(fib_result)) == NUMBER_SIZE:
            break
        else:
            current_index += 1

    return current_index


if __name__ == "__main__":
    fib_index = determine_fibonacci_index_for_digit_size(NUMBER_SIZE)

    print "The first index in the fibonacci series with %s digits is %s" % (NUMBER_SIZE, fib_index)
