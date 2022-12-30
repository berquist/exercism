from collections import defaultdict
from typing import Callable, DefaultDict, Iterable, Optional, Set, Tuple


def _validate_inputs(min_factor: int, max_factor: int) -> None:
    if max_factor < min_factor:
        raise ValueError("min must be <= max")


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


def _palindromes_inner(
    *, min_factor: int, max_factor: int
) -> DefaultDict[int, Set[Tuple[int, int]]]:
    palindromes = defaultdict(set)
    # We need a way to find all palindromes in linear time in the number of
    # factors.  That means that for each factor it must take a constant amount
    # of time to generate TODO
    for x in range(min_factor, max_factor + 1):
        for y in range(x, max_factor + 1):
            prod = x * y
            if _is_palindrome(prod):
                palindromes[prod].add((x, y))
    return palindromes


def _palindromes(
    *, min_factor: int, max_factor: int, op: Callable[[Iterable[int]], int]
) -> Tuple[Optional[int], Tuple[Tuple[int, int], ...]]:
    palindromes = _palindromes_inner(min_factor=min_factor, max_factor=max_factor)
    if palindromes:
        palindrome = op(palindromes.keys())
        products = tuple(palindromes[palindrome])
        return palindrome, products
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
    _validate_inputs(min_factor, max_factor)
    return _palindromes(min_factor=min_factor, max_factor=max_factor, op=max)


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
    _validate_inputs(min_factor, max_factor)
    return _palindromes(min_factor=min_factor, max_factor=max_factor, op=min)
