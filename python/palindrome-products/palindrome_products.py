from collections import defaultdict
from itertools import product
from typing import Callable, DefaultDict, Iterable, Optional, Set, Tuple


def _validate_inputs(min_factor: int, max_factor: int) -> None:
    if max_factor < min_factor:
        raise ValueError("min must be <= max")


def _is_palindrome(num: int) -> bool:
    num_str = str(num)
    return num_str == num_str[::-1]


def _palindromes_inner(
    *, min_factor: int, max_factor: int
) -> DefaultDict[int, Set[Tuple[int, int]]]:
    palindromes = defaultdict(set)
    for x, y in product(range(min_factor, max_factor + 1), repeat=2):
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
