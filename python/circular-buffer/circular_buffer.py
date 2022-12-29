from functools import partial
from typing import List


class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """
    def __init__(self, message: str) -> None:
        pass


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """
    def __init__(self, message: str) -> None:
        pass


def _inc_wrap(limit: int, num: int) -> int:
    can = num + 1
    if can > limit:
        return 0
    return can


class CircularBuffer:
    def __init__(self, capacity: int) -> None:
        self._cap = capacity
        self._buf: List[List[str]] = [[] for _ in range(self._cap)]
        self._ptr_r = 0
        self._ptr_w = 0
        self._inc = partial(_inc_wrap, self._cap - 1)

    def read(self) -> str:
        if not self._buf[self._ptr_r]:
            raise BufferEmptyException("Circular buffer is empty")
        new_ptr_r = self._inc(self._ptr_r)
        val = self._buf[self._ptr_r].pop()
        self._ptr_r = new_ptr_r
        print(self)
        return val

    def write(self, data: str) -> None:
        if self._buf[self._ptr_w]:
            raise BufferFullException("Circular buffer is full")
        self._buf[self._ptr_w].append(data)
        self._ptr_w = self._inc(self._ptr_w)
        print(self)

    def overwrite(self, data: str) -> None:
        # on full buffer set reading to oldest item which is the *next*
        # present item after the write
        full = bool(self._buf[self._ptr_w])
        if full:
            self._buf[self._ptr_w].pop()
        self._buf[self._ptr_w].append(data)
        self._ptr_w = self._inc(self._ptr_w)
        if full:
            self._ptr_r = self._inc(self._ptr_r)
            while not self._buf[self._ptr_r]:
                self._ptr_r = self._inc(self._ptr_r)
        print(self)

    def clear(self) -> None:
        self._buf = [[] for _ in range(self._cap)]

    def __str__(self) -> str:
        return f"[rp:{self._ptr_r}|wp:{self._ptr_w}]{self._buf}"
