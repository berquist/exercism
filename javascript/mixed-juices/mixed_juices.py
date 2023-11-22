from typing import List, Union

def remaining_orders(time_left: Union[int, float], orders: List[str]) -> List[str]:
    pass


assert remaining_orders(
    7,
    [
        "Tropical Island",
        "Energizer",
        "Limetime",
        "All or Nothing",
        "Pure Strawberry Joy",
    ],
    ["All or Nothing", "Pure Strawberry Joy"],
)
assert remaining_orders(
    13,
    [
        "Pure Strawberry Joy",
        "Pure Strawberry Joy",
        "Vitality",
        "Tropical Island",
        "All or Nothing",
        "All or Nothing",
        "All or Nothing",
        "Green Garden",
        "Limetime",
    ],
    ["All or Nothing", "Green Garden", "Limetime"],
)
assert remaining_orders(
    12,
    [
        "Energizer",
        "Green Garden",
        "Ruby Glow",
        "Pure Strawberry Joy",
        "Tropical Island",
        "Limetime",
    ],
    [],
)
assert remaining_orders(0.2, ["Bananas Gone Wild", "Pure Strawberry Joy"]) == [
    "Pure Strawberry Joy"
]
