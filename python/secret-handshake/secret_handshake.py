from typing import List


def commands(binary_str: str) -> List[str]:
    ret = [
        instruction
        for (intstr, instruction) in zip(
            reversed(binary_str[1:]),
            ["wink", "double blink", "close your eyes", "jump"],
        )
        if intstr == "1"
    ]
    if binary_str[0] == "1":
        return list(reversed(ret))
    return ret
