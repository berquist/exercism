from typing import MutableSequence


def _reverse_acc(string: str, acc: MutableSequence[str]) -> str:
    # There are many ways to do this (addition of a list of one element rather
    # than append, accumulating directly into a string...).  The first
    # alternative is probably how I'd do it in a recursive Scheme/Lisp
    # solution.  We avoid using a string directly for the accumulator because
    # (once upon a time?) this was slower than joining a list of strings.
    if not string:
        return "".join(acc)
    acc.append(string[-1])
    return _reverse_acc(string[:-1], acc)


def reverse(text: str) -> str:
    # idiomatic way...
    # return text[::-1]
    return _reverse_acc(text, list())
