from math import floor, sqrt
from typing import List


def get_factors(number: int) -> List[int]:
    candidates = range(1, 2 + floor(sqrt(number)))
    low_factors = list(filter(lambda x: (number % x) == 0, candidates))
    high_factors = list(map(lambda x: number // x, low_factors))
    return sorted(set(low_factors + high_factors))


def classify(number: int) -> str:
    """A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError("Classification is only possible for positive integers.")
    factors = get_factors(number)
    aliquot_sum = sum(factors) - number
    if aliquot_sum > number:
        return "abundant"
    elif aliquot_sum < number:
        return "deficient"
    else:
        return "perfect"
