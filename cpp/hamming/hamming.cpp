#include <algorithm>
#include <numeric>
#include <stdexcept>
#include <vector>
#include "hamming.h"

namespace hamming {

unsigned compute(const std::string &left, const std::string &right) {
    if (left.size() != right.size()) {
        throw std::domain_error("mismatch in input lengths");
    }
    std::vector<unsigned> differences(left.size());
    std::transform(left.begin(), left.end(), right.begin(), differences.begin(),
                   [](const auto &l, const auto &r) { return l != r; });
    return std::accumulate(differences.begin(), differences.end(), 0);
}

}  // namespace hamming
