from typing import List


_COLORS = [
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white",
]


def color_code(color: str) -> int:
    return _COLORS.index(color)


def colors() -> List[str]:
    return _COLORS
