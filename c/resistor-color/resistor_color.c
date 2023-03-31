#include "resistor_color.h"

uint16_t color_code(resistor_band_t color) {
    /* No need for cast thank to implicit conversion */
    return color;
}

static resistor_band_t colors_[] = {
    BLACK, BROWN, RED, ORANGE, YELLOW, GREEN, BLUE, VIOLET, GREY, WHITE
};

resistor_band_t * colors() {
    return &colors_[0];
}
