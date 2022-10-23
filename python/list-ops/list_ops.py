from itertools import chain
from typing import Any, Callable, Iterable, List, TypeVar

T = TypeVar("T")


def append(lst1: List[T], lst2: List[T]) -> List[T]:
    return lst1 + lst2


def concat(lsts: Iterable[List[T]]) -> List[T]:
    return list(chain(*lsts))


def filter(function: Callable[[T], bool], lst: List[T]) -> List[T]:
    return [x for x in lst if function(x)]


def length(lst: List[Any]) -> int:
    return len(lst)


def map(function: Callable[[T], T], lst: List[T]) -> List[T]:
    return [function(x) for x in lst]


def foldl(function: Callable[[T, T], T], lst: List[T], initial: T) -> T:
    acc = initial
    for x in lst:
        acc = function(x, acc)
    return acc


def foldr(function: Callable[[T, T], T], lst: List[T], initial: T) -> T:
    acc = initial
    for x in reversed(lst):
        acc = function(x, acc)
    return acc


def reverse(lst: List[T]) -> List[T]:
    return lst[::-1]
