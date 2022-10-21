#include <math.h>
#include <stdint.h>
#include <stdlib.h>
#include "armstrong_numbers.h"

#define NDIGITS 20

/* This is to silence -Werror=missing-declarations while allowing it to remain
 * private / not in the header. */
size_t extract_digits(int number, uint8_t* digits);

size_t extract_digits(int number, uint8_t* digits) {
    size_t offset = 0;
    while (number >= 10) {
        digits[offset] = number % 10;
        number /= 10;
        offset += 1;
    }
    digits[offset] = number;
    return offset + 1;
}

bool is_armstrong_number(int candidate) {
    uint8_t digits[NDIGITS];
    const size_t ndigits = extract_digits(candidate, &digits[0]);
    int acc = 0;
    for (size_t i = 0; i < ndigits; i++) {
        acc += pow(digits[i], ndigits);
    }
    return candidate == acc;
}
