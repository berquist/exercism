"""
This exercise stub and the test suite contain several enumerated constants.

Since Python 2 does not have the enum module, the idiomatic way to write
enumerated constants has traditionally been a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

from enum import Enum, auto
from typing import List, TypeVar

# We don't write Python 2 anymore...
class Retval(Enum):
    Sublist = auto()
    Superlist = auto()
    Equal = auto()
    Unequal = auto()


# Possible sublist categories.
# Change the values as you see fit.
SUBLIST = Retval.Sublist
SUPERLIST = Retval.Superlist
EQUAL = Retval.Equal
UNEQUAL = Retval.Unequal

T = TypeVar("T")


def _contains(candidate_superlist: List[T], candidate_sublist: List[T]) -> bool:
    nsuper, nsub = len(candidate_superlist), len(candidate_sublist)
    for i in range(nsuper - nsub + 1):
        if candidate_superlist[i:i+nsub] == candidate_sublist:
            return True
    return False


def sublist(list_one: List[T], list_two: List[T]) -> Retval:
    if list_one == list_two:
        return EQUAL
    if _contains(list_one, list_two):
        return SUPERLIST
    if _contains(list_two, list_one):
        return SUBLIST
    return UNEQUAL
