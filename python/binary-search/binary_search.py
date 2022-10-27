from typing import Sequence, TypeVar

T = TypeVar("T", int, float)


def find_iter(search_list: Sequence[T], value: T) -> int:
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


def find_recur_ext_acc(search_list: Sequence[T], value: T, ilo: int, ihi: int) -> int:
    if ilo > ihi:
        raise ValueError("value not in array")
    imid = (ihi + ilo) // 2
    if search_list[imid] < value:
        return find_recur_ext_acc(search_list, value, imid + 1, ihi)
    if search_list[imid] > value:
        return find_recur_ext_acc(search_list, value, ilo, imid - 1)
    return imid


def find_recur_ext(search_list: Sequence[T], value: T) -> int:
    return find_recur_ext_acc(search_list, value, 0, len(search_list) - 1)


def find_recur(search_list: Sequence[T], value: T) -> int:
    def find_recur_acc(ilo: int, ihi: int) -> int:
        if ilo > ihi:
            raise ValueError("value not in array")
        imid = (ihi + ilo) // 2
        if search_list[imid] < value:
            return find_recur_acc(imid + 1, ihi)
        if search_list[imid] > value:
            return find_recur_acc(ilo, imid - 1)
        return imid

    return find_recur_acc(0, len(search_list) - 1)


def find(search_list: Sequence[T], value: T) -> int:
    return find_recur(search_list, value)
