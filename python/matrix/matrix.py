class Matrix(object):
    def __init__(self, matrix_string):
        self._rows = []
        self._cols = []
        for row in matrix_string.splitlines():
            row = [int(x) for x in row.split()]
            self._rows.append(row)
            while len(self._cols) != len(row):
                self._cols.append([])
            for i, e in enumerate(row):
                self._cols[i].append(e)

    def row(self, index):
        return self._rows[index - 1]

    def column(self, index):
        return self._cols[index - 1]
