#include "armstrong_numbers.h"
#include <algorithm>
#include <cmath>
#include <numeric>
#include <vector>

std::vector<unsigned int> get_digits(unsigned long long number) {
    std::vector<unsigned int> digits;
    while (number >= 10) {
        digits.push_back(number % 10);
        number /= 10;
    }
    digits.push_back(number);
    return digits;
}

namespace armstrong_numbers {

bool is_armstrong_number(const unsigned long long number) {
    auto digits = get_digits(number);
    std::for_each(
        digits.begin(),
        digits.end(),
        [&](auto &digit) { digit = std::pow(digit, digits.size()); });
    const auto sum = std::accumulate(digits.cbegin(), digits.cend(), static_cast<unsigned long long>(0));
    return sum == number;
}

}  // namespace armstrong_numbers
