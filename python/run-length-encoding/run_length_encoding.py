def encode(string: str) -> str:
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
