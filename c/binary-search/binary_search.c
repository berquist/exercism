#include "binary_search.h"
#include <stdio.h>

const int *binary_search(int value, const int *arr, size_t length) {
    if (length == 0) return NULL;
    size_t ilo = 0, ihi = length - 1;
    size_t imid;
    int current_val;
    while (ilo <= ihi) {
        imid = (ihi + ilo) / 2;
        current_val = arr[imid];
        if (current_val < value) {
            // We aren't going to overflow because of the main loop
            // condition...
            ilo = imid + 1;
        } else if (current_val > value) {
            // ...but we might underflow.
            if (imid == 0) break;
            ihi = imid - 1;
        } else {
            return &arr[imid];
        }
    }
    return NULL;
}
