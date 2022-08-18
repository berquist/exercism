#include "collatz_conjecture.h"
#include <stdexcept>

namespace collatz_conjecture {

unsigned steps(const long long num) {
    if (num < 1) {
        throw std::domain_error("cannot pass number less than one");
    }
    unsigned val = num, nsteps = 0;
    while (val != 1) {
        if (val % 2 == 0) {
            val /= 2;
        } else {
            val = (3 * val) + 1;
        }
        nsteps++;
    }
    return nsteps;
}

}  // namespace collatz_conjecture
