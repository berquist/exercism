"""Functions to keep track and alter inventory."""

from collections import Counter
from copy import deepcopy
from typing import Dict, Iterable, List, Mapping, MutableMapping, Tuple, TypeVar

T = TypeVar("T")


def create_inventory(items: Iterable[T]) -> Dict[T, int]:
    """Create a dict that tracks the amount (count) of each element on the `items` list.

    :param items: list - list of items to create an inventory from.
    :return: dict - the inventory dictionary.
    """

    return dict(Counter(items))


def add_items(inventory: MutableMapping[T, int], items: Iterable[T]) -> Dict[T, int]:
    """Add or increment items in inventory using elements from the items `list`.

    :param inventory: dict - dictionary of existing inventory.
    :param items: list - list of items to update the inventory with.
    :return: dict - the inventory updated with the new items.
    """

    new_inventory = deepcopy(inventory)
    for item in items:
        if item in new_inventory:
            new_inventory[item] += 1
        else:
            new_inventory[item] = 1
    return dict(new_inventory)


def decrement_items(
    inventory: MutableMapping[T, int], items: Iterable[T]
) -> Dict[T, int]:
    """Decrement items in inventory using elements from the `items` list.

    :param inventory: dict - inventory dictionary.
    :param items: list - list of items to decrement from the inventory.
    :return: dict - updated inventory with items decremented.
    """

    new_inventory = deepcopy(inventory)
    for item in items:
        if item in new_inventory:
            if new_inventory[item] > 0:
                new_inventory[item] -= 1
    return dict(new_inventory)


def remove_item(inventory: MutableMapping[T, int], item: T) -> Dict[T, int]:
    """Remove item from inventory if it matches `item` string.

    :param inventory: dict - inventory dictionary.
    :param item: str - item to remove from the inventory.
    :return: dict - updated inventory with item removed. Current inventory if item does not match.
    """

    new_inventory = deepcopy(inventory)
    if item in new_inventory:
        new_inventory.pop(item)
    return dict(new_inventory)


def list_inventory(inventory: Mapping[T, int]) -> List[Tuple[T, int]]:
    """Create a list containing all (item_name, item_count) pairs in inventory.

    :param inventory: dict - an inventory dictionary.
    :return: list of tuples - list of key, value pairs from the inventory dictionary.
    """

    return [item for item in inventory.items() if item[1] > 0]
