#include <math.h>
#include "grains.h"

uint64_t square(uint8_t index) {
    return pow(2, index - 1);
}

uint64_t total() {
    uint64_t acc = 0;
    for (uint8_t i = 1; i <= 64; i++) {
        acc += square(i);
    }
    return acc;
}
