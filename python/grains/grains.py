def square(number: int) -> int:
    if not (number >= 1 and number <= 64):
        raise ValueError("square must be between 1 and 64")
    return 2 ** (number - 1)


def total() -> int:
    return 2 * square(64) - 1
