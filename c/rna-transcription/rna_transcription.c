#include <stdlib.h>
#include <string.h>
#include "rna_transcription.h"

char *to_rna(const char *dna) {
    const size_t len = strlen(dna);
    char *ret = malloc((len + 1) * sizeof(char));
    if (ret != NULL) {
        char d;
        for (size_t i = 0; i < len; i++) {
            d = dna[i];
            switch (d) {
            case 'C': ret[i] = 'G'; break;
            case 'G': ret[i] = 'C'; break;
            case 'A': ret[i] = 'U'; break;
            case 'T': ret[i] = 'A'; break;
            }
        }
        ret[len] = '\0';
    }
    return ret;
}
