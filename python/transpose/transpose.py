def transpose(lines: str) -> str:
    spl = lines.splitlines()
    if not spl:
        return ""
    nr, nc = len(spl), max(len(row) for row in spl)
    transposed = [list() for _ in range(nc)]
    for ir in range(nr):
        for ic in range(nc):
            try:
                transposed[ic].append(spl[ir][ic])
            except IndexError:
                transposed[ic].append(" ")
    return "\n".join(["".join(row) for row in transposed]).strip()
