#include "difference_of_squares.h"
#include <algorithm>
#include <cmath>
#include <numeric>
#include <vector>

namespace difference_of_squares {

unsigned square_of_sum(const unsigned n) {
    // unsigned ret = 0;
    // for (unsigned i = 1; i <= n; i++) {
    //     ret += i;
    // }
    // return std::pow(ret, 2);
    std::vector<unsigned> range(n);
    std::iota(range.begin(), range.end(), 1);
    return std::pow(std::accumulate(range.begin(), range.end(), 0), 2);
}

unsigned sum_of_squares(const unsigned n) {
    // unsigned ret = 0;
    // for (unsigned i = 1; i <= n; i++) {
    //     ret += std::pow(i, 2);
    // }
    // return ret;
    std::vector<unsigned> range(n);
    std::iota(range.begin(), range.end(), 1);
    std::for_each(range.begin(), range.end(), [](unsigned &i) { i = std::pow(i, 2); });
    return std::accumulate(range.begin(), range.end(), 0);
}

unsigned difference(const unsigned n) {
    return square_of_sum(n) - sum_of_squares(n);
}

}  // namespace difference_of_squares
