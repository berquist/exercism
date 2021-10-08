;; -*- lexical-binding: t; -*-
;;; nucleotide-count.el --- nucleotide-count Exercise (exercism)

;;; Commentary:

;;; Code:
(defun nucleotide-count (nucleotides)
  ;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Self_002dEvaluating-Forms.html
  ;; (let ((counts '((?A . 0) (?C . 0) (?G . 0) (?T . 0))))
  (let ((counts (list (cons ?A 0) (cons ?C 0) (cons ?G 0) (cons ?T 0))))
    (dolist (element (string-to-list nucleotides) counts)
      (let ((element-count (alist-get element counts)))
        (if element-count
            (setf (alist-get element counts) (1+ element-count))
          (error "invalid base"))))))

(provide 'nucleotide-count)
;;; nucleotide-count.el ends here
