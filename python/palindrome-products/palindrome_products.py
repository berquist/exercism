from typing import Optional, Tuple


def _is_palindrome(num: int) -> bool:
    num_str = str(num)
    return num_str == num_str[::-1]


# Converting to a string is faster than the following:

# from typing import List


# def _get_digits(number: int) -> List[int]:
#     digits = []
#     while number >= 10:
#         digits.append(number % 10)
#         number //= 10
#     digits.append(number)
#     return digits


# def _is_palindrome(num: int) -> bool:
#     digits = _get_digits(num)
#     left, right = 0, len(digits) - 1
#     while right > left:
#         if digits[left] != digits[right]:
#             return False
#         left += 1
#         right -= 1
#     return True

# ripped from
# https://exercism.org/tracks/python/exercises/palindrome-products/solutions/ninevoltradish
# since I could only intuit the quadratic solution

def _palindromes(
    *, min_factor: int, max_factor: int, checkrange: Tuple[int, int, int]
) -> Tuple[Optional[int], Tuple[Tuple[int, int], ...]]:
    if max_factor < min_factor:
        raise ValueError("min must be <= max")
    for num in range(*checkrange):
        if _is_palindrome(num):
            prime_factors = list()
            for i in range(min_factor, max_factor + 1):
                if num % i == 0 and min_factor <= i <= num // i <= max_factor:
                    prime_factors.append((i, num // i))
            if prime_factors != list():
                return num, tuple(prime_factors)
    return None, ()


def largest(
    *, min_factor: int = 0, max_factor: int
) -> Tuple[Optional[int], Tuple[Tuple[int, int], ...]]:
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
             Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    return _palindromes(
        min_factor=min_factor,
        max_factor=max_factor,
        checkrange=(max_factor**2, min_factor**2 - 1, -1),
    )


def smallest(
    *, min_factor: int = 0, max_factor: int
) -> Tuple[Optional[int], Tuple[Tuple[int, int], ...]]:
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
    Iterable should contain both factors of the palindrome in an arbitrary order.
    """
    return _palindromes(
        min_factor=min_factor,
        max_factor=max_factor,
        checkrange=(min_factor**2, max_factor**2 + 1, 1),
    )
