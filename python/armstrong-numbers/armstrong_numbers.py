def is_armstrong_number(number: int) -> bool:
    digits = [int(dig) for dig in str(number)]
    return sum(dig ** len(digits) for dig in digits) == number
