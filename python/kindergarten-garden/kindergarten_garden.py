INITIAL_TO_PLANT = {"R": "Radishes", "C": "Clover", "G": "Grass", "V": "Violets"}
POSSIBLE_CHILDREN = (
    "Alice",
    "Bob",
    "Charlie",
    "David",
    "Eve",
    "Fred",
    "Ginny",
    "Harriet",
    "Ileana",
    "Joseph",
    "Kincaid",
    "Larry",
)


class Garden:
    def __init__(self, diagram, students=None):
        if students is None:
            self._students = {student: [] for student in POSSIBLE_CHILDREN}
        else:
            self._students = {student: [] for student in sorted(students)}
        for row in diagram.splitlines():
            for i, student in enumerate(self._students):
                for initial in row[i * 2 : (i * 2) + 2]:
                    self._students[student].append(INITIAL_TO_PLANT[initial])

    def plants(self, child):
        return self._students[child]
