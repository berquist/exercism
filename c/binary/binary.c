#include <math.h>
#include <string.h>
#include "binary.h"

int convert(const char *input) {
    const size_t sl = strlen(input);
    if (sl == 0) return INVALID;
    char dig;
    size_t place = 0;
    int idig;
    int dec = 0;
    for (size_t i = 0; i < sl; i++) {
        dig = input[i];
        if (!((dig == 48) || (dig == 49))) return INVALID;
        idig = dig - 48;
        place = sl - 1 - i;
        dec += idig * pow(2, place);
    }
    return dec;
}
