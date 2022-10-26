#include <math.h>
/* #include <stdio.h> */
#include "square_root.h"

uint16_t square_root(uint16_t num) {
    const double thresh = 1.0e-14;
    double x, a, b;
    /* Initial guess */
    x = num / 2.0;
    /* Perform iterations of
     * https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Bakhshali_method */
    /* size_t counter = 0; */
    while (fabs(num - (x * x)) > thresh) {
        a = (num - (x * x)) / (2 * x);
        b = x + a;
        x = b - ((a * a) / (2 * b));
        /* counter++; */
    }
    /* printf("num = %u sqrt = %lf niterations = %lu\n", num, x, counter); */
    return x;
}
