from typing import List, Tuple


_MINE = "*"
_HOLE = " "


def _is_valid_index(nr: int, nc: int, index: Tuple[int, int]) -> bool:
    return (0 <= index[0] < nr) and (0 <= index[1] < nc)


def _get_valid_indices(nr: int, nc: int, ir: int, ic: int) -> List[Tuple[int, int]]:
    candidate_indices = [
        (ir - 1, ic - 1),
        (ir - 1, ic),
        (ir - 1, ic + 1),
        (ir, ic - 1),
        (ir, ic + 1),
        (ir + 1, ic - 1),
        (ir + 1, ic),
        (ir + 1, ic + 1),
    ]
    return [pair for pair in candidate_indices if _is_valid_index(nr, nc, pair)]


def test_valid_indices() -> None:
    # absolute center
    assert sorted(_get_valid_indices(3, 3, 1, 1)) == [
        (0, 0),
        (0, 1),
        (0, 2),
        (1, 0),
        (1, 2),
        (2, 0),
        (2, 1),
        (2, 2),
    ]
    # top left
    assert sorted(_get_valid_indices(3, 3, 0, 0)) == [(0, 1), (1, 0), (1, 1)]
    # bottom right
    assert sorted(_get_valid_indices(3, 3, 2, 2)) == [(1, 1), (1, 2), (2, 1)]


def _count_bombs(minefield: List[str], indices_hole: Tuple[int, int]) -> int:
    return sum(
        minefield[surrounding[0]][surrounding[1]] == _MINE
        for surrounding in _get_valid_indices(
            len(minefield), len(minefield[0]), indices_hole[0], indices_hole[1]
        )
    )


_INVALID_BOARD_ERROR = "The board is invalid with current input."


def annotate(minefield: List[str]) -> List[str]:
    if len(set(len(row) for row in minefield)) > 1:
        raise ValueError(_INVALID_BOARD_ERROR)

    new_minefield = list()

    for ir, row in enumerate(minefield):
        if (set(row) - {_MINE, _HOLE}) != set():
            raise ValueError(_INVALID_BOARD_ERROR)
        new_row = row
        for ic, point in enumerate(row):
            if point == _HOLE:
                count = _count_bombs(minefield, (ir, ic))
                if count > 0:
                    new_row = f"{new_row[:ic]}{count}{new_row[ic+1:]}"
        new_minefield.append(new_row)

    return new_minefield
