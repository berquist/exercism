from typing import Generic, Iterable, Optional, TypeVar

T = TypeVar("T")


class Node(Generic[T]):
    def __init__(self, value: T) -> None:
        self._value = value
        self._next = None

    def value(self) -> T:
        return self._value

    def next(self) -> Optional["Node"]:
        return self._next


class LinkedList(Generic[T]):
    """Implementation of a last in, first out stack via a singly-linked list."""

    def __init__(self, values: Iterable[T] = list()) -> None:
        self._head: Optional[Node[T]] = None
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

    def head(self) -> Node[T]:
        h = self._head
        if h is None:
            raise EmptyListException("The list is empty.")
        return h

    def push(self, value: T) -> None:
        """Push a new value on to the stack.

        This value becomes the new head.
        """
        prev = self._head
        new_node = Node(value)
        if prev is not None:
            new_node._next = prev
        self._head = new_node

    def pop(self) -> T:
        node = self._head
        if node is None:
            raise EmptyListException("The list is empty.")
        val = node.value()
        self._head = node._next
        return val

    def reversed(self) -> "LinkedList[T]":
        return LinkedList(self)


class EmptyListException(Exception):
    pass
