_OPENING = ["[", "(", "{"]
_CLOSING = ["]", ")", "}"]
# _PAIRS = {o:c for o, c in zip(_OPENING, _CLOSING)} | {c:o for o, c in zip(_OPENING, _CLOSING)}
_CLOSING_TO_OPENING = {c:o for o, c in zip(_OPENING, _CLOSING)}

def is_paired(input_string: str) -> bool:
    stack = list()
    for c in input_string.strip():
        if c in _OPENING:
            stack.append(c)
        elif c in _CLOSING:
            if not stack:
                return False
            if stack.pop() != _CLOSING_TO_OPENING[c]:
                return False
    return not stack
