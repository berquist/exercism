# derived from my elisp solution with the macro converted to a normal function

def _rotate_char_branch(c: int, key: int, bound: int) -> int:
    sc = c + key
    while sc > bound:
        sc -= 26
    return sc


def _rotate_char(c: str, key: int) -> str:
    assert len(c) == 1
    i = ord(c)
    if i >= 65 and i <= 90:
        i = _rotate_char_branch(i, key, 90)
    elif i >= 97 and i <= 122:
        i = _rotate_char_branch(i, key, 122)
    return chr(i)


def rotate(text: str, key: int) -> str:
    return "".join(_rotate_char(c, key) for c in text)
