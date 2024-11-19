from copy import deepcopy
from typing import List, Tuple


def encode_iter(string: str) -> str:
    if not string:
        return ""
    pairs = list()
    counter = 1
    for pos, current_char in enumerate(string[1:], start=1):
        prev_char = string[pos - 1]
        if prev_char != current_char:
            pairs.append((counter, prev_char))
            counter = 1
        else:
            counter += 1
    # Don't forget the last character in the string.
    pairs.append((counter, string[-1]))
    return "".join(
        char if counter == 1 else f"{counter}{char}" for counter, char in pairs
    )


def encode_recur(string: str) -> str:
    def encode_recur_acc(
        *,
        remaining: str,
        prev_char: str,
        current_char: str,
        counter: int,
        acc: List[Tuple[int, str]],
    ) -> str:
        counters = deepcopy(acc)
        s = f"{counters} prev={prev_char} curr={current_char} counter={counter}"
        if not remaining:
            return s
        if prev_char != current_char:
            counters.append((counter, prev_char))
            counter = 1
            # counters
        else:
            counter += 1
            # last_counter = counters[-1]
            # counters[-1] = (last_counter[0] + 1, last_counter[1])
        return encode_recur_acc(
            remaining=remaining[1:],
            prev_char=current_char,
            current_char=remaining[0],
            counter=counter,
            acc=counters,
        )

    if not string:
        return ""
    if len(string) == 1:
        return string
    return encode_recur_acc(
        remaining=string[2:],
        prev_char=string[0],
        current_char=string[1],
        counter=1,
        acc=list(),
    )


def encode(string: str) -> str:
    # return encode_recur(string)
    return encode_iter(string)


def decode(string: str) -> str:
    acc = list()
    counters = list()
    for current_char in string:
        if current_char.isdigit():
            counters.append(current_char)
        else:
            counter = "".join(counters)
            if counter:
                acc.append(current_char * int(counter))
                counters = list()
            else:
                acc.append(current_char)
    return "".join(acc)


for i, s in enumerate(
    [
        "",
        "XYZ",
        "AABBBCCCC",
        "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB",
        "  hsqq qww  ",
    ]
):
    print(f"[{i}] {s} -> {encode_recur(s)}")
