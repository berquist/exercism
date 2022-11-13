from typing import Dict, Mapping, Iterable


def transform(legacy_data: Mapping[int, Iterable[str]]) -> Dict[str, int]:
    ret = dict()
    for count, letters in legacy_data.items():
        for letter in letters:
            ret[letter.lower()] = count
    return ret
