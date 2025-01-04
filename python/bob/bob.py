def _is_silence(s: str) -> bool:
    return not s.strip()


def _is_question(s: str) -> bool:
    return s.strip()[-1] == "?"


def _is_yelling(s: str) -> bool:
    return s.isupper()


def _is_yelling_question(s: str) -> bool:
    return _is_yelling(s) and _is_question(s)


def response(hey_bob: str) -> str:
    if _is_silence(hey_bob):
        return "Fine. Be that way!"
    elif _is_yelling_question(hey_bob):
        return "Calm down, I know what I'm doing!"
    elif _is_question(hey_bob):
        return "Sure."
    elif _is_yelling(hey_bob):
        return "Whoa, chill out!"
    return "Whatever."
