from typing import List


def _get_digits(number: int) -> List[int]:
    digits = []
    while number >= 10:
        digits.append(number % 10)
        number //= 10
    digits.append(number)
    return digits


def is_armstrong_number(number: int) -> bool:
    digits = _get_digits(number)
    print(digits)
    return sum(dig ** len(digits) for dig in digits) == number
