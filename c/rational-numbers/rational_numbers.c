#include <math.h>
#include "rational_numbers.h"

rational_t add(rational_t left, rational_t right) {
    rational_t new = {
        .numerator = left.numerator * right.denominator + left.denominator * right.numerator,
        .denominator = left.denominator * right.denominator,
    };
    return reduce(new);
}

rational_t subtract(rational_t left, rational_t right) {
    rational_t new = {
        .numerator = left.numerator * right.denominator - left.denominator * right.numerator,
        .denominator = left.denominator * right.denominator,
    };
    return reduce(new);
}

rational_t multiply(rational_t left, rational_t right) {
    rational_t new = {
        .numerator = left.numerator * right.numerator,
        .denominator = left.denominator * right.denominator,
    };
    return reduce(new);
}

rational_t divide(rational_t top, rational_t bottom) {
    rational_t new = {
        .numerator = top.numerator * bottom.denominator,
        .denominator = top.denominator * bottom.numerator,
    };
    return reduce(new);
}

static long long abs_ll(long long val) {
    if (val < 0) return -val;
    return val;
}

rational_t absolute(rational_t val) {
    rational_t new = {
        .numerator = abs_ll(val.numerator),
        .denominator = abs_ll(val.denominator),
    };
    return reduce(new);
}

static long long pow_ll(long long base, int16_t pow) {
    long long acc = 1;
    if (pow > 0) {
        for (int16_t i = 0; i < pow; i++) {
            acc *= base;
        }
    } else {
        for (int16_t i = 0; i < pow; i++) {
            acc /= base;
        }
    }
    return acc;
}

rational_t exp_rational(rational_t base, int16_t pow) {
    rational_t new;
    if (pow > 0) {
        new.numerator = pow_ll(base.numerator, pow);
        new.denominator = pow_ll(base.denominator, pow);
    } else {
        new.numerator = pow_ll(base.denominator, -pow);
        new.denominator = pow_ll(base.numerator, -pow);
    }
    return reduce(new);
}

float exp_real(uint16_t base, rational_t exp) {
    return pow(base, 1.0 * exp.numerator / exp.denominator);
}

static long long gcd(long long a, long long b) {
    a = abs_ll(a);
    b = abs_ll(b);

    while (b != 0) {
        const long long temp = b;
        b = a % b;
        a = temp;
    }

    return a;
}

rational_t reduce(rational_t val) {
    rational_t new = val;
    /* Make sure a negative sign appears in the numerator rather than the
     * denominator. */
    if (new.denominator < 0) {
        new.numerator = -new.numerator;
        new.denominator = -new.denominator;
    }
    /* Trap zeroes. */
    if (new.numerator == 0) {
        new.denominator = 1;
        return new;
    }
    /* Perform the actual reduction. */
    const long long val_gcd = gcd(new.numerator, new.denominator);
    new.numerator /= val_gcd;
    new.denominator /= val_gcd;
    return new;
}
