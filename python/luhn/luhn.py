import re
from typing import List


def _make_below_ten(num: int) -> int:
    if num > 9:
        return num - 9
    return num


def _scale_every_enth(nums: List[int], scale: int, enth: int) -> List[int]:
    return list(
        reversed(
            [
                num * ((scale * (not (idx - 1) % enth)) or 1)
                for idx, num in enumerate(reversed(nums))
            ]
        )
    )


class Luhn:
    def __init__(self, card_num: str) -> None:
        no_spaces = re.sub(r"\s", "", card_num)
        self._has_junk = no_spaces != re.sub(r"[a-zA-Z\W]", "", no_spaces)
        if not self._has_junk:
            self._card_num = [int(dig) for dig in no_spaces]
        else:
            self._card_num = list()

    def valid(self) -> bool:
        """Is this a valid Luhn number?"""
        return (
            (not self._has_junk)
            and (len(self._card_num) > 1)
            and (
                not sum(map(_make_below_ten, _scale_every_enth(self._card_num, 2, 2)))
                % 10
            )
        )
