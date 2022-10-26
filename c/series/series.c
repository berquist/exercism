#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "series.h"

slices_t slices(char *input_text, unsigned int substring_length) {
    const unsigned long input_length = strlen(input_text);
    const unsigned int nslices = input_length - substring_length + 1;
    slices_t s;
    if ((input_length == 0) || (substring_length == 0) || (nslices == 0)
        || (substring_length > input_length)) {
        s.substring_count = 0;
        /* Not necessary? */
        /* s.substring = malloc(1 * sizeof(char*)); */
        return s;
    }
    s.substring_count = nslices;
    const size_t nptrb = nslices * sizeof(char*);
    s.substring = malloc(nptrb);
    for (size_t i = 0; i < nslices; i++) {
        char* const single_slice = malloc((substring_length + 1) * sizeof(char));
        memcpy(single_slice, &input_text[i], substring_length * sizeof(char));
        single_slice[substring_length] = '\0';
        s.substring[i] = single_slice;
    }
    return s;
}
