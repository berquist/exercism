;;; binary-search.el --- Binary Search (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'cl-macs)
(require 'seq)

(defun find-binary (array value)
  (cl-labels
      ((find-binary-acc (array value ilo ihi)
         (when (<= ilo ihi)
           (let* ((imid (/ (+ ihi ilo) 2))
                  (current (seq-elt array imid)))
             (cond
              ((< current value) (find-binary-acc array value (1+ imid) ihi))
              ((> current value) (find-binary-acc array value ilo (1- imid)))
              (t imid))))))
    (find-binary-acc array value 0 (1- (length array)))))


(provide 'binary-search)
;;; binary-search.el ends here
