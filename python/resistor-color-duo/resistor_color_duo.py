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


def value(colors: List[str]) -> int:
    return int(str(color_code(colors[0])) + str(color_code(colors[1])))
