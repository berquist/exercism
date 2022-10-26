#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "nucleotide_count.h"

#define INITBUFSIZ 100

char *count(const char *dna_strand) {
    char* output = calloc(INITBUFSIZ, sizeof(char));
    size_t input_offset = 0;
    size_t counts[4] = {0, 0, 0, 0};
    char current = dna_strand[input_offset];
    while (current != '\0') {
        if (current == 'A') {
            counts[0] += 1;
        } else if (current == 'C') {
            counts[1] += 1;
        } else if (current == 'G') {
            counts[2] += 1;
        } else if (current == 'T') {
            counts[3] += 1;
        } else {
            output = realloc(output, 1);
            output[0] = '\0';
            return output;
        }
        current = dna_strand[++input_offset];
    }
    sprintf(output, "A:%lu C:%lu G:%lu T:%lu", counts[0], counts[1], counts[2], counts[3]);
    output = realloc(output, (strlen(output) + 1) * sizeof(char));
    return output;
}
