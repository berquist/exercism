#include <stdbool.h>
#include <stdlib.h>
#include "sieve.h"

// Calculate at most `max_primes` prime numbers in the interval [2,limit]
// using the Sieve of Eratosthenes and store the prime numbers in `primes`
// in increasing order.
// The function returns the number of calculate primes.
//
// implementation notes: primes doesn't need to be allocated, it's already
// done on the stack in the tests
uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes) {
    uint32_t nprimes = 0;
    if (limit >= 2) {
        const uint32_t ncand = limit - 1;
        bool * const marks = calloc(ncand, sizeof(bool));
        if (marks != NULL) {
            uint32_t i;
            for (uint32_t cand = 2; cand <= limit; cand++) {
                i = 2 * cand - 2;
                while (i < (limit - 1)) {
                    marks[i] = true;
                    i += cand;
                }
            }
            for (i = 0; i < ncand; i++) {
                if (nprimes >= max_primes) break;
                if (!marks[i]) {
                    primes[nprimes] = 2 + i;
                    nprimes++;
                }
            }
        }
        free(marks);
    }
    return nprimes;
}
