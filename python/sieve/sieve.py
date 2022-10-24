from typing import List


def primes(limit: int) -> List[int]:
    ret = list()
    if limit >= 2:
        candidates = list(range(2, limit + 1))
        marks = [False for _ in range(len(candidates))]
        for candidate in candidates:
            i = 2 * candidate - 2
            while i < limit - 1:
                marks[i] = True
                i += candidate
        for i, mark in enumerate(marks):
            if not mark:
                ret.append(candidates[i])
    return ret
