from typing import Any, Sequence, List, TypeVar

T = TypeVar("T")


def _flatten_acc(seq: Sequence[Any], acc: List[T]) -> List[T]:
    if not seq:
        return acc
    candidate = seq[0]
    if not isinstance(candidate, list):
        if candidate is not None:
            acc.append(candidate)
        return _flatten_acc(seq[1:], acc)
    return acc + _flatten_acc(candidate, list()) + _flatten_acc(seq[1:], list())


def flatten(iterable: Sequence[Any]) -> List[Any]:
    return _flatten_acc(iterable, list())
