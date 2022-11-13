from typing import Dict, Mapping, Iterable


def transform(legacy_data: Mapping[int, Iterable[str]]) -> Dict[str, int]:
    ret = dict()
    for count, letters in legacy_data.items():
        letters = (letter.lower() for letter in letters)
        for letter in letters:
            if letter in ret:
                ret[letter] += count
            else:
                ret[letter] = count
    return ret
