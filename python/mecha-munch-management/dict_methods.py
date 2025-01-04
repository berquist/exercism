"""Functions to manage a users shopping cart items."""

from typing import Any, Dict, Iterable, List, Tuple


Cart = Dict[str, int]

def add_item(current_cart: Cart, items_to_add: Iterable[str]) -> Cart:
    """Add items to shopping cart.

    :param current_cart: dict - the current shopping cart.
    :param items_to_add: iterable - items to add to the cart.
    :return: dict - the updated user cart dictionary.
    """

    for item in items_to_add:
        if item not in current_cart:
            current_cart[item] = 1
        else:
            current_cart[item] += 1
    return current_cart


def read_notes(notes: Iterable[str]) -> Cart:
    """Create user cart from an iterable notes entry.

    :param notes: iterable of items to add to cart.
    :return: dict - a user shopping cart dictionary.
    """

    return add_item(dict(), notes)


def update_recipes(ideas: Dict[str, Dict[str, int]], recipe_updates: Iterable[Tuple[str, Dict[str, int]]]) -> Dict[str, Dict[str, int]]:
    """Update the recipe ideas dictionary.

    :param ideas: dict - The "recipe ideas" dict.
    :param recipe_updates: dict - dictionary with updates for the ideas section.
    :return: dict - updated "recipe ideas" dict.
    """

    for recipe, ingredients in recipe_updates:
        ideas[recipe] = ingredients
    return ideas


def sort_entries(cart: Cart) -> Cart:
    """Sort a users shopping cart in alphabetically order.

    :param cart: dict - a users shopping cart dictionary.
    :return: dict - users shopping cart sorted in alphabetical order.
    """

    return {k: cart[k] for k in sorted(cart.keys())}


Inventory = Dict[str, List[Any]]
FulfillmentCart = Inventory


def send_to_store(cart: Cart, aisle_mapping: Dict[str, List[Any]]) -> FulfillmentCart:
    """Combine users order to aisle and refrigeration information.

    :param cart: dict - users shopping cart dictionary.
    :param aisle_mapping: dict - aisle and refrigeration information dictionary.
    :return: dict - fulfillment dictionary ready to send to store.
    """
    fulfillment = dict()
    for ingredient, count in cart.items():
        fulfillment[ingredient] = [count] + aisle_mapping[ingredient]
    return dict(reversed(sorted(fulfillment.items())))


def update_store_inventory(fulfillment_cart: FulfillmentCart, store_inventory: Inventory) -> Inventory:
    """Update store inventory levels with user order.

    :param fulfillment cart: dict - fulfillment cart to send to store.
    :param store_inventory: dict - store available inventory
    :return: dict - store_inventory updated.
    """

    for ingredient, (cart_count, _, _) in fulfillment_cart.items():
        assert ingredient in fulfillment_cart
        store_inventory[ingredient][0] -= cart_count
        if store_inventory[ingredient][0] < 1:
            store_inventory[ingredient][0] = "Out of Stock"
    return store_inventory
