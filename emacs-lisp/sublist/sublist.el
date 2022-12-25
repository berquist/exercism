;;; sublist.el --- Sublist (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-lib)

(defun sl--contains (candidate-sub candidate-super)
  "Does CANDIDATE-SUPER contain CANDIDATE-SUB as a sublist?"
  (let ((nsub (seq-length candidate-sub))
        (nsuper (seq-length candidate-super)))
    (when (>= nsuper nsub)
      (cl-dolist (start (number-sequence 0 (- nsuper nsub)))
        (when (equal candidate-sub (seq-subseq candidate-super start (+ start nsub)))
          (cl-return t))))))

(defun list-classify (list1 list2)
  (cond
   ((equal list1 list2) :equal)
   ((sl--contains list1 list2) :sublist)
   ((sl--contains list2 list1) :superlist)
   (t :unequal)))

(provide 'sublist)

;;; sublist.el ends here
