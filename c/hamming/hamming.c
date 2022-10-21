#include <stdbool.h>
#include <stdlib.h>
#include "hamming.h"

int compute(const char *lhs, const char *rhs) {
    int diff = 0;
    size_t offset = 0;
    char l, r;
    bool ln = false, rn = false;
    while (true) {
        l = lhs[offset], r = rhs[offset];
        ln = (l == '\0');
        rn = (r == '\0');
        if (ln || rn) {
            if (ln && rn) return diff;
            else return -1;
        }
        if (l != r) diff += 1;
        offset += 1;
    }
    return diff;
}
