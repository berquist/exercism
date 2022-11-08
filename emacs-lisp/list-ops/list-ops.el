;;; list-ops.el --- List Ops (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;; Normally I'd try to use `seq-' or `cl-' methods, but here is as close to
;; raw elisp as possible, often by copying the list-specific code from seq.

;;; Code:


(defun list-foldl (fun list accu)
  (dolist (elt list accu)
    (setq accu (funcall fun accu elt))))

(defun list-foldr (fun list accu)
  (dolist (elt (reverse list) accu)
    (setq accu (funcall fun elt accu))))

(defun list-empty-p (list)
  (null list))

(defun list-sum (list)
  (apply #'+ list))

(defun list-length (list)
  (length list))

(defun list-append (list1 list2)
  (append list1 list2))

(defun list-reverse (list)
  (reverse list))

(defun list-concatenate (list1 list2 &rest LISTS)
  (append list1 list2 (mapcan #'identity LISTS)))

(defun list-filter (list predicate)
  (let ((acc '()))
    (dolist (elt list)
      (if (funcall predicate elt)
          (setq acc (cons elt acc))))
    (reverse acc)))

(defun list-map (list fun)
  (mapcar fun list))

(provide 'list-ops)
;;; list-ops.el ends here
