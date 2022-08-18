#include "difference_of_squares.h"
#include <cmath>

namespace difference_of_squares {

unsigned square_of_sum(const unsigned n) {
    unsigned ret = 0;
    for (unsigned i = 0; i <= n; i++) {
        ret += i;
    }
    return std::pow(ret, 2);
}

unsigned sum_of_squares(const unsigned n) {
    unsigned ret = 0;
    for (unsigned i = 0; i <= n; i++) {
        ret += std::pow(i, 2);
    }
    return ret;
}

unsigned difference(const unsigned n) {
    return square_of_sum(n) - sum_of_squares(n);
}

}  // namespace difference_of_squares
