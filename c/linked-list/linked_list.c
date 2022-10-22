#include <assert.h>
#include <stdlib.h>
#include "linked_list.h"

struct list_node {
   struct list_node *prev, *next;
   ll_data_t data;
};

struct list {
   struct list_node *first, *last;
};

struct list *list_create(void) {
   struct list *new_list;
   new_list = malloc(sizeof(struct list));
   if (new_list != NULL) {
      new_list->first = NULL;
      new_list->last = NULL;
   }
   return new_list;
}

size_t list_count(const struct list *list) {
   size_t count = 0;
   if (list != NULL) {
      struct list_node *node = list->first;         
      if (node != NULL) {
         while (node != NULL) {
            node = node->next;
            count++;
         }
      }
   }
   return count;
}

void list_push(struct list *list, ll_data_t item_data) {
   assert(list != NULL);
   struct list_node *new_node = malloc(sizeof(struct list_node));
   if (new_node != NULL) {
      new_node->data = item_data;
      new_node->next = NULL;
      if (list->first == NULL) {
         list->first = new_node;
         new_node->prev = NULL;
      } else {
         struct list_node *current_last = list->last;
         assert(current_last != NULL);
#ifndef NDEBUG
         const size_t count = list_count(list);
         if (count == 1) {
            assert(current_last->prev == NULL);
         } else {
            assert(current_last->prev != NULL);
         }
#endif
         assert(current_last->next == NULL);
         current_last->next = new_node;
         new_node->prev = current_last;
      }
      list->last = new_node;
   }
}

ll_data_t list_pop(struct list *list) {
   ll_data_t popped_data;
   assert(list != NULL);
   struct list_node *popped_last = list->last;
   assert(popped_last != NULL);
   popped_data = popped_last->data;
   /* TODO doesn't work when count is zero */
   if (list->first == popped_last) {
      free(popped_last);
      list->first = NULL;
      list->last = NULL;
   } else {
      struct list_node *new_last = popped_last->prev;
      free(popped_last);
      new_last->next = NULL;
      list->last = new_last;
   }
   return popped_data;
}

// inserts item at front of a list
void list_unshift(struct list *list, ll_data_t item_data) {
   struct list_node *new_node = malloc(sizeof(struct list_node));
   if (new_node != NULL) {
      new_node->data = item_data;
      new_node->prev = NULL;
      struct list_node *current_first = list->first;
      list->first = new_node;
      if (current_first == NULL) {
         assert(list->last == NULL);
         list->last = new_node;
         new_node->next = NULL;
      } else {
         assert(list->last != NULL);
         new_node->next = current_first;
         current_first->prev = new_node;
      }
   }
}

// removes item from front of a list
ll_data_t list_shift(struct list *list) {
   ll_data_t shifted_data;
   assert(list != NULL);
   assert(list->first != NULL);
   assert(list->last != NULL);
   struct list_node *current_first = list->first;
   shifted_data = current_first->data;
   if (current_first == list->last) {
      /* One element is same as popping */
      free(current_first);
      list->first = NULL;
      list->last = NULL;
   } else {
      struct list_node *new_first = current_first->next;
      free(current_first);
      new_first->prev = NULL;
      list->first = new_first;
   }
   return shifted_data;
}

void list_delete(struct list *list, ll_data_t data) {
   assert(list != NULL);
   struct list_node *candidate_node = list->first;
   if (candidate_node != NULL) {
      while (candidate_node != NULL) {
         if (candidate_node->data == data) {
            struct list_node *prev = candidate_node->prev;
            struct list_node *next = candidate_node->next;
            if (prev != NULL) {
               prev->next = candidate_node->next;
            }
            if (next != NULL) {
               next->prev = candidate_node->prev;
            }
            if (candidate_node == list->first) {
               list->first = next;
            }
            if (candidate_node == list->last) {
               list->last = prev;
            }
            free(candidate_node);
            return;
         } else {
            candidate_node = candidate_node->next;
         }
      }
   }
}

void list_destroy(struct list *list) {
   if (list != NULL) {
      struct list_node *tmp;
      struct list_node *node = list->first;
      while (node != NULL) {
         tmp = node->next;
         free(node);
         node = tmp;
      }
      list->first = NULL;
      list->last = NULL;
      free(list);
   }
}
