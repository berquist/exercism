class Matrix(object):
    def __init__(self, matrix_string):
        self._mat = [
            [int(x) for x in row.split()] for row in matrix_string.splitlines()
        ]

    def row(self, index):
        return self._mat[index - 1]

    def column(self, index):
        return [row[index - 1] for row in self._mat]
