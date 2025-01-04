def square_root(number: int) -> int:
    """Calculate the square root of a natural number using
    https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Bakhshali_method"""
    thresh = 1.0e-14
    x = number / 2.0
    while abs(number - (x ** 2)) > thresh:
        a = (number - (x ** 2)) / (2 * x)
        b = x + a
        x = b - ((a ** 2) / (2 * b))
    return int(x)
