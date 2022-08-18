#include "leap.h"

namespace leap {

bool is_leap_year(const unsigned year) {
    const bool div_4 = (year % 4) == 0;
    const bool div_100 = (year % 100) == 0;
    const bool div_400 = (year % 400) == 0;
    return div_400 || (div_4 && !div_100);
}

}  // namespace leap
