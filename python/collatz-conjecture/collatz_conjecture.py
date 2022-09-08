def steps(number: int) -> int:
    if number < 1:
        raise ValueError("Only positive integers are allowed")
    val, nsteps = number, 0
    while val != 1:
        if val % 2 == 0:
            val //= 2
        else:
            val = (3 * val) + 1
        nsteps += 1
    return nsteps
