import secrets


def private_key(p: int) -> int:
    # want (1, p) -> [2, p)
    # if randbelow provides [0, p), shift up by two to get [2, p+2), then reduce top bound
    return 2 + secrets.randbelow(p - 2)


def public_key(p: int, g: int, private: int) -> int:
    return (g ** private) % p


def secret(p: int, public: int, private: int) -> int:
    return (public ** private) % p
