#include <assert.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "run_length_encoding.h"

#define MAXNCHAR 512
#define MAXNDIG 24

char *encode(const char *text) {
    char* joined = malloc(MAXNCHAR * sizeof(char));
    if (joined == NULL) { exit(1); }
    if (text[0] == '\0') {
        joined = realloc(joined, 1 * sizeof(char));
        joined[0] = '\0';
        return joined;
    }
    char chars[MAXNCHAR];
    size_t counters[MAXNCHAR];
    size_t counter = 1, istr = 1, ic = 0;
    char prev = text[istr - 1];
    char current = text[istr];
    bool done = (current == '\0');
    while (!done) {
        if (ic >= MAXNCHAR) { exit(1); }
        if (prev != current) {
            chars[ic] = prev;
            counters[ic] = counter;
            ic++;
            counter = 1;
        } else {
            counter++;
        }
        istr++;
        prev = text[istr - 1];
        current = text[istr];
        done = (current == '\0');
    }
    /* Don't forget the last character in the string. */
    if (ic >= MAXNCHAR) { exit(1); }
    chars[ic] = prev;
    counters[ic] = counter;
    size_t offset = 0;
    for (size_t i = 0; i <= ic; i++, offset++) {
        /* The "+1" is for \0. */
        if (counters[i] == 1) {
            snprintf(&joined[offset], 1 + 1, "%c", chars[i]);
        } else {
            const size_t len = snprintf(NULL, 0, "%zu", counters[i]);
            snprintf(&joined[offset], len + 1, "%zu", counters[i]);
            offset += len;
            snprintf(&joined[offset], 1 + 1, "%c", chars[i]);
        }
    }
    joined = realloc(joined, (offset + 1) * sizeof(char));
    return joined;
}

char *decode(const char *data) {
    char* joined = malloc(MAXNCHAR * sizeof(char));
    if (joined == NULL) { exit(1); }
    if (data[0] == '\0') {
        joined = realloc(joined, 1 * sizeof(char));
        joined[0] = '\0';
        return joined;
    }
    /* idata is the pointer into the text we're decoding.  offset is the
     * pointer into the result (decoded) data buffer.  co is the pointer into
     * the buffer that holds the number of character repetitions. */
    size_t idata = 0, offset = 0, co = 0;
    char current = data[idata];
    bool done = (current == '\0');
    char* counter = calloc(MAXNDIG, sizeof(char));
    if (counter == NULL) { exit(1); }
    /* https://stackoverflow.com/a/29321286/: The "+1" in all printf calls is
     * for \0. */
    while (!done) {
        if (isdigit((unsigned char)current)) {
            snprintf(&counter[co], 1 + 1, "%c", current);
            co++;
        } else {
            /* The number of times to print a letter is stored in the counter
             * buffer; convert that into a uint and write that many instances
             * of this character to joined.  If there's nothing in the counter
             * buffer, the letter was unprefixed: it only appeared once in the
             * original string. */
            unsigned long count = strtoul(counter, NULL, 10);
            assert(count != 1);
            if (count == 0) {
                count = 1;
            }
            for (size_t i = 0; i < count; i++) {
                snprintf(&joined[offset++], 1 + 1, "%c", current);
            }
            co = 0;
            memset(counter, '\0', MAXNDIG * sizeof(char));
        }
        idata++;
        current = data[idata];
        done = (current == '\0');
    }
    joined = realloc(joined, (offset + 1) * sizeof(char));
    free(counter);
    return joined;
}
