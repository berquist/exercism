from typing import Optional, TypeVar, Iterable, Generic

T = TypeVar("T")

class Node(Generic[T]):
    def __init__(self, value: T) -> None:
        self._value = value
        self._next = None

    def value(self) -> T:
        return self._value

    def next(self) -> Optional["Node"]:
        return self._next

    def insert(self, value: T) -> None:
        new_node = Node(value)
        if self._next is None:
            self._next = new_node
        else:
            new_node = self._next
            self._next = new_node


class LinkedList(Generic[T]):
    def __init__(self, values: Iterable[T] = list()) -> None:
        self._head = None
        for value in values:
            self.push(value)

    def __len__(self) -> int:
        size = 0
        node = self._head
        while node is not None:
            node = node.next()
            size += 1
        return size

    def __iter__(self):
        node = self._head
        while node is not None:
            yield node.value()
            node = node.next()

    def head(self):
        h = self._head
        if h is None:
            raise EmptyListException("The list is empty.")
        return h

    def push(self, value: T) -> None:
        node = self._head
        if node is None:
            self._head = Node(value)
        else:
            while node.next() is not None:
                node = node.next()
            node.insert(value)


    def pop(self) -> T:
        node = self._head
        if node is None:
            raise EmptyListException("The list is empty.")
        # prev = None
        # while node is not None:
        #     prev = node
        #     node = node.next()
        val = node.value()
        # node._next = None
        return val

    def reversed(self):
        pass


class EmptyListException(Exception):
    pass
