import random
from typing import Tuple


def _get_factorization(n: int) -> Tuple[int, int]:
    # obtain the condition n - 1 == (2**s) * d by factoring out powers of two
    # from n - 1
    s = 0
    d = n - 1
    while d % 2 == 0:
        d >>= 1
        s += 1
    assert n - 1 == 2**s * d
    return d, s


# Miller-Rabin primality test, adapted from
# https://rosettacode.org/wiki/Miller%E2%80%93Rabin_primality_test#Python
def _is_prime(n: int, k: int = 8) -> bool:
    if n in (0, 1, 4, 6, 8, 9):
        return False
    elif n < 10:
        return True

    d, s = _get_factorization(n)

    def trial_composite(a: int) -> bool:
        if pow(a, d, n) == 1:
            return False
        for i in range(s):
            if pow(a, 2**i * d, n) == n - 1:
                return False
        return True

    for _ in range(k):
        if trial_composite(random.randrange(2, n)):
            return False

    return True


def prime(number: int) -> int:
    if number < 0:
        raise ValueError
    if number == 0:
        raise ValueError("there is no zeroth prime")

    count, candidate, current = 1, 2, 2
    while count < number:
        candidate += 1
        if _is_prime(candidate):
            count += 1
            current = candidate
    return current
