from typing import Sequence, TypeVar

T = TypeVar("T", int, float)


def find(search_list: Sequence[T], value: T) -> int:
    ilo, ihi = 0, len(search_list) - 1
    while ilo <= ihi:
        imid = (ihi + ilo) // 2
        if search_list[imid] < value:
            ilo = imid + 1
        elif search_list[imid] > value:
            ihi = imid - 1
        else:
            return imid
    raise ValueError("value not in array")
