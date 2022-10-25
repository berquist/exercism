#ifndef RATIONAL_NUMBERS_H
#define RATIONAL_NUMBERS_H

#include <stdint.h>

typedef struct {
    long long numerator;
    long long denominator;
} rational_t;

rational_t add(rational_t left, rational_t right);
rational_t subtract(rational_t left, rational_t right);
rational_t multiply(rational_t left, rational_t right);
rational_t divide(rational_t top, rational_t bottom);
rational_t absolute(rational_t val);
rational_t exp_rational(rational_t base, int16_t pow);
float exp_real(uint16_t base, rational_t exp);
rational_t reduce(rational_t val);
#endif
