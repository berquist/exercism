from itertools import permutations
from typing import Iterable, Union


def _equality_one(sides: Iterable[Union[float, int]]) -> bool:
    return all(float(side) > 0.0 for side in sides)


def _equality_two(sides: Iterable[Union[float, int]]) -> bool:
    s = list(sides)
    return all((s[p[0]] + s[p[1]]) >= s[p[2]] for p in permutations(range(3), 3))


def equilateral(sides: Iterable[Union[float, int]]) -> bool:
    s = set(sides)
    return len(s) == 1 and _equality_one(s)


def isosceles(sides: Iterable[Union[float, int]]) -> bool:
    return len(set(sides)) <= 2 and _equality_one(sides) and _equality_two(sides)


def scalene(sides: Iterable[Union[float, int]]) -> bool:
    return len(set(sides)) == 3 and _equality_one(sides) and _equality_two(sides)
