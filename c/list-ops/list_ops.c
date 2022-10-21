#include <string.h>
#include "list_ops.h"

list_t *new_list(size_t length, list_element_t elements[]) {
    list_t* list = (list_t*)malloc(sizeof(list_t) + (length * sizeof(list_element_t)));
    if (list != NULL) {
        list->length = length;
        for (size_t i = 0; i < length; i++) {
            list->elements[i] = elements[i];
        }
    }
    return list;
}

list_t *append_list(list_t *list1, list_t *list2) {
    size_t s1 = 0, s2 = 0, new_length = 0;
    if (list1 != NULL) {
        s1 = list1->length;
        new_length += s1;
    }
    if (list2 != NULL) {
        s2 = list2->length;
        new_length += s2;
    }
    const size_t n = new_length * sizeof(list_element_t);
    list_t* new_list = (list_t*)malloc(sizeof(list_t) + n);
    if (new_list != NULL) {
        new_list->length = new_length;
        size_t offset = 0;
        for (size_t i1 = 0; i1 < s1; i1++, offset++) {
            new_list->elements[offset] = list1->elements[i1];
        }
        for (size_t i2 = 0; i2 < s2; i2++, offset++) {
            new_list->elements[offset] = list2->elements[i2];
        }
    }
    return new_list;
}

list_t *filter_list(list_t *list, bool (*filter)(list_element_t)) {
    /*
      There are two possible algorithms with ~O(n) time complexity, where n is
      the length of the list:

      - Assuming the cost of allocating memory is small compared to evaluating
        the filtering function, and that memory is cheap, the new list is
        allocated with size n_old, running over list_old is done once,
        assigning to list_new with the correct offset, then realloc is called
        on list_new to shrink things down properly.

      - Assuming the cost of evaluating the filtering function is small
        compared to allocating memory, and that memory is expensive, the old
        list is iterated over and the filter evaluated so that the right size
        n_new can be predetermined, then list_new is created with the correct
        size directly, and assignment is done in a second iteration pass.

      The approach taken here is the former: memory is cheap, some
      fragmentation is ok.
    */
    size_t old_length = 0, new_length = 0;
    if (list != NULL) {
        old_length = list->length;
    }
    list_t* new_list = (list_t*)malloc(sizeof(list_t) + (old_length * sizeof(list_element_t)));
    if (new_list != NULL) {
        for (size_t iold = 0; iold < old_length; iold++) {
            if (filter(list->elements[iold])) {
                new_list->elements[new_length++] = list->elements[iold];
            }
        }
        new_list = realloc(new_list, sizeof(list_t) + (new_length * sizeof(list_element_t)));
        new_list->length = new_length;
    }
    return new_list;
}

size_t length_list(list_t *list) {
    if (list == NULL) return 0;
    return list->length;
}

list_t *map_list(list_t *list, list_element_t (*map)(list_element_t)) {
    size_t new_length = 0;
    if (list != NULL) {
        new_length = list->length;
    }
    list_t* new_list = (list_t*)malloc(sizeof(list_t) + (new_length * sizeof(list_element_t)));
    if (new_list != NULL) {
        new_list->length = new_length;
        for (size_t i = 0; i < new_length; i++) {
            new_list->elements[i] = map(list->elements[i]);
        }
    }
    return new_list;
}

list_element_t foldl_list(list_t *list, list_element_t initial,
                          list_element_t (*foldl)(list_element_t,
                                                  list_element_t)) {
    list_element_t acc = initial;
    if (list != NULL) {
        for (size_t i = 0; i < list->length; i++) {
            acc = foldl(list->elements[i], acc);
        }
    }
    return acc;
}

list_element_t foldr_list(list_t *list, list_element_t initial,
                          list_element_t (*foldr)(list_element_t,
                                                  list_element_t)) {
    list_element_t acc = initial;
    if (list != NULL) {
        size_t count = list->length;
        while (count) {
            acc = foldr(list->elements[--count], acc);
        }
    }
    return acc;
}

list_t *reverse_list(list_t *list) {
    size_t new_length = 0;
    if (list != NULL) {
        new_length = list->length;
    }
    list_t* new_list = (list_t*)malloc(sizeof(list_t) + (new_length * sizeof(list_element_t)));
    if (new_list != NULL) {
        new_list->length = new_length;
        for (size_t inew = 0, iold = list->length - 1;
             inew < new_length;
             inew++, iold--) {
            new_list->elements[inew] = list->elements[iold];
        }
    }
    return new_list;
}

void delete_list(list_t *list) {
    if (list != NULL) {
        free(list);
    }
}
