import re
from itertools import chain
from typing import TypeVar, List

T = TypeVar("T")

_ALPHABET = "abcdefghijklmnopqrstuvwxyz"
_ALPHABET_REV = _ALPHABET[::-1]
_MAP = {f: b for f, b in zip(_ALPHABET, _ALPHABET_REV)}
_N = 5


def _insert_every(seq: List[T], to_insert: T, group_size: int) -> List[T]:
    return list(
        chain(
            *[
                seq[i : i + group_size] + [to_insert]
                if len(seq[i : i + group_size]) == group_size
                else seq[i : i + group_size]
                for i in range(0, len(seq), group_size)
            ]
        )
    )


def encode(plain_text: str) -> str:
    encoded_chars = [_MAP.get(c, c) for c in re.sub(r"[^\w]", "", plain_text.lower())]
    return "".join(_insert_every(encoded_chars, " ", _N)).strip()


def decode(ciphered_text: str) -> str:
    return "".join([_MAP.get(c, c) for c in ciphered_text.replace(" ", "")])
