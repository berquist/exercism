#include "armstrong_numbers.h"
#include <algorithm>
#include <cmath>
#include <numeric>
#include <vector>

using digit_t = unsigned int;

std::vector<digit_t> get_digits(number_t number) {
    std::vector<digit_t> digits;
    while (number >= 10) {
        digits.push_back(number % 10);
        number /= 10;
    }
    digits.push_back(number);
    return digits;
}

namespace armstrong_numbers {

bool is_armstrong_number(const number_t number) {
    auto digits = get_digits(number);
    std::for_each(
        digits.begin(),
        digits.end(),
        [&](auto &digit) { digit = std::pow(digit, digits.size()); });
    const auto sum = std::accumulate(digits.cbegin(), digits.cend(), static_cast<number_t>(0));
    return sum == number;
}

}  // namespace armstrong_numbers
