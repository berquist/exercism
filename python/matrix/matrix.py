class Matrix(object):
    def __init__(self, matrix_string):
        self._rows = []
        self._cols = []
        for row in matrix_string.splitlines():
            self._rows.append([])
            for icol, telement in enumerate(row.split()):
                element = int(telement)
                self._rows[-1].append(element)
                while len(self._cols) <= icol:
                    self._cols.append([])
                self._cols[icol].append(element)

    def row(self, index):
        return self._rows[index - 1]

    def column(self, index):
        return self._cols[index - 1]
