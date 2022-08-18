#include "pangram.h"
#include <algorithm>
#include <cctype>
#include <unordered_set>
#include <vector>

namespace pangram {

const std::string alphabet_str("abcdefghijklmnopqrstuvwxyz");
// const std::unordered_set<std::string> alphabet(alphabet_str.begin(), alphabet_str.end());

bool is_pangram(const std::string &str) {
    std::string lowered(str);
    std::transform(lowered.begin(), lowered.end(), lowered.begin(),
                   [](const auto &c) { return std::tolower(c); });
    // const std::unordered_set<std::string> candidates(lowered.begin(), lowered.end());
    // std::vector<std::string> diff;
    // std::set_difference(alphabet.begin(), alphabet.end(),
    //                     candidates.begin(), candidates.end(),
    //                     std::inserter(diff, diff.end()));
    std::sort(lowered.begin(), lowered.end());
    std::vector<char> diff;
    std::set_difference(alphabet_str.begin(), alphabet_str.end(),
                        lowered.begin(), lowered.end(),
                        std::inserter(diff, diff.end()));
    return diff.size() == 0;
}

}  // namespace pangram
