def is_valid(isbn):
    stripped = "".join(isbn.split("-"))
    if len(stripped) != 10:
        return False
    nine, last = stripped[:9], stripped[9]
    check_val = 10 if last == "X" else int(last) if last.isdigit() else None
    if check_val is None or not nine.isnumeric():
        return False
    values = [int(d) for d in nine] + [check_val]
    return (
        sum(factor * value for factor, value in zip(range(10, 0, -1), values)) % 11 == 0
    )
