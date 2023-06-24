;;; flatten-array.el --- Flatten Array (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defun list-flatten-acc (lst acc)
  (cond
   ((zerop (length lst)) acc)
    ;; ignore nil
    ((eq (car lst) nil) (list-flatten-acc (cdr lst) acc))
    ;; atom
    ((not (listp (car lst))) (list-flatten-acc (cdr lst) (append acc (list (car lst)))))
    ;; list
    (t (list-flatten-acc (cdr lst) (append acc (list-flatten (car lst)))))))

(defun list-flatten (list)
  (list-flatten-acc list '()))

(provide 'flatten-array)
;;; flatten-array.el ends here
