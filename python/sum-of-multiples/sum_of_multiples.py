from typing import Collection


def sum_of_multiples(limit: int, multiples: Collection[int]) -> int:
    return sum(
        num
        for num in range(limit)
        if any(num % multiple == 0 for multiple in set(multiples) - {0,})
    )
