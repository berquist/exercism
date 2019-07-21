def convert(number):
    s = []
    if number % 3 == 0:
        s.append("Pling")
    if number % 5 == 0:
        s.append("Plang")
    if number % 7 == 0:
        s.append("Plong")
    return "".join(s) if s else str(number)
