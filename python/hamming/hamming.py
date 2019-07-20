def distance(strand_a, strand_b):
    lsa, lsb = len(strand_a), len(strand_b)
    if lsa != lsb:
        raise ValueError(
            "Incompatible lengths: {} ({}) and {} ({})".format(
                strand_a, lsa, strand_b, lsb
            )
        )
    return sum(ca != cb for ca, cb in zip(strand_a, strand_b))
