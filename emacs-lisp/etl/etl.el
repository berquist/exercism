;;; etl.el --- etl Exercise (exercism)

;;; Commentary:

;;; Code:

(require 'seq)

(defun hash->list (hash)
  (let (lst)
    (maphash (lambda (k v) (push (cons k v) lst)) hash)
    lst))

(defun etl (dirty-data)
  (let ((cleaned-data (make-hash-table :size 26))
        (dirty-lists (hash->list dirty-data)))
    (dolist (score-to-letters dirty-lists)
      (let ((score (car score-to-letters))
            (letters (cdr score-to-letters)))
        (cond
         ((<= score 0)
          (error "cannot have negative score"))
         ((seq-some (lambda (candidate) (not (stringp candidate))) letters)
          (error "must only have strings for letters"))
         (t
          (mapc (lambda (letter) (puthash (downcase letter) score cleaned-data)) letters)))))
    cleaned-data))

(provide 'etl)
;;; etl.el ends here
