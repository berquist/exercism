"""Functions which helps the locomotive engineer to keep track of the train."""

from typing import Dict, List, Mapping, Tuple


def get_list_of_wagons(*wagons) -> List[int]:
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """
    return list(wagons)


def fix_list_of_wagons(
    each_wagons_id: List[int], missing_wagons: List[int]
) -> List[int]:
    """Fix the list of wagons.

    :parm each_wagons_id: list - the list of wagons.
    :parm missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """
    return [
        *each_wagons_id[2 : each_wagons_id.index(1) + 1],
        *missing_wagons,
        *each_wagons_id[each_wagons_id.index(1) + 1 :],
        *each_wagons_id[:2],
    ]


def add_missing_stops(route: Mapping[str, str], **stops):
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """
    return {**route, "stops": list(stops.values())}


def extend_route_information(
    route: Mapping[str, str], more_route_information: Mapping[str, str]
) -> Dict[str, str]:
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """
    return {**route, **more_route_information}


def fix_wagon_depot(
    wagons_rows: List[List[Tuple[int, str]]]
) -> List[List[Tuple[int, str]]]:
    """Fix the list of rows of wagons.

    :param wagons_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """
    ret = [list() for _ in range(len(wagons_rows))]
    # ABC    ADG
    # DEF -> BEH
    # GHI    CFI
    for row in wagons_rows:
        for i, pair in enumerate(row):
            ret[i].append(pair)
    return ret
