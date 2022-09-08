_ALPHABET = set("abcdefghijklmnopqrstuvwxyz")


def is_pangram(sentence: str) -> bool:
    return not (_ALPHABET - set(sentence.lower()))
