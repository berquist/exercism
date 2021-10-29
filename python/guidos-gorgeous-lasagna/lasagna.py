EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(num_layers: int) -> int:
    """Calculate the number of time to prepare based on the number of layers.

    :param num_layers: int number of layers in the lasagna.
    :return int: amoutn of time required (in minutes) to prepare the lasagna.

    The amount of time to prepare a single layer is given by `PREPARATION_TIME`.
    """
    return PREPARATION_TIME * num_layers


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """Calculate how much time has been spent on the lasagna so far.

    :param number_of_layers: int number of layers in the lasagna.
    :param elapsed_bake_time: int number of minutes already spent in the oven.
    :return int: total amount of time spent on the lasagna so far.
    """
    return elapsed_bake_time + preparation_time_in_minutes(number_of_layers)
