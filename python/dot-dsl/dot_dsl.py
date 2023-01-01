from collections.abc import Iterable, Mapping
from enum import Enum, auto
import typing


class DotType(Enum):
    NODE = auto()
    EDGE = auto()
    ATTR = auto()


NODE, EDGE, ATTR = DotType.NODE, DotType.EDGE, DotType.ATTR


class Node:
    def __init__(self, name: str, attrs: Mapping[str, str]) -> None:
        self.name = name
        self.attrs = dict(attrs)

    def __eq__(self, other: "Node") -> bool:
        return self.name == other.name and self.attrs == other.attrs


class Edge:
    def __init__(
        self,
        src: typing.Union[str, int],
        dst: typing.Union[str, int],
        attrs: Mapping[str, str],
    ) -> None:
        self.src = str(src)
        self.dst = str(dst)
        self.attrs = dict(attrs)

    def __eq__(self, other: "Edge") -> bool:
        return (
            self.src == other.src
            and self.dst == other.dst
            and self.attrs == other.attrs
        )


class Graph:
    def __init__(self, data: typing.Optional[typing.Iterable] = None) -> None:
        self.nodes = list()
        self.edges = list()
        self.attrs = dict()
        if data is not None:
            if not (isinstance(data, Iterable) and not isinstance(data, str)):
                raise TypeError("Graph data malformed")
            for entry in data:
                if not entry:
                    raise TypeError("Graph item incomplete")
                if not isinstance(entry[0], DotType):
                    raise ValueError("Unknown item")
                if entry[0] == NODE:
                    if len(entry) < 3:
                        raise TypeError("Graph item incomplete")
                    if not isinstance(entry[2], Mapping):
                        raise ValueError("Node is malformed")
                    self.nodes.append(Node(*entry[1:]))
                elif entry[0] == EDGE:
                    if len(entry) < 4:
                    #     raise TypeError("Graph item incomplete")
                    # if not isinstance(entry[3], Mapping):
                        raise ValueError("Edge is malformed")
                    self.edges.append(Edge(*entry[1:]))
                elif entry[0] == ATTR:
                    if len(entry) < 3:
                        raise TypeError("Graph item incomplete")
                    if len(entry) > 3:
                        raise ValueError("Attribute is malformed")
                    self.attrs[entry[1]] = entry[2]
