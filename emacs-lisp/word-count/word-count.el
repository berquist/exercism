;;; word-count.el --- word-count Exercise (exercism)

;;; Commentary:

;;; Code:

;; This stuff taken from s.el

(defun s-split (separator s &optional omit-nulls)
  "Split S into substrings bounded by matches for regexp SEPARATOR.
If OMIT-NULLS is non-nil, zero-length substrings are omitted.

This is a simple wrapper around the built-in `split-string'."
  (declare (side-effect-free t))
  (save-match-data
    (split-string s separator omit-nulls)))

(defun s-split-words (s)
  "Split S into list of words."
  (declare (side-effect-free t))
  (s-split
   "[^[:word:]0-9']+"
   (let ((case-fold-search nil))
     (replace-regexp-in-string
      "\\([[:lower:]]\\)\\([[:upper:]]\\)" "\\1 \\2"
      (replace-regexp-in-string "\\([[:upper:]]\\)\\([[:upper:]][0-9[:lower:]]\\)" "\\1 \\2" s)))
   t))

;; This doesn't work because behind the scenes alist-get uses `eq', not `equal'...
;;
;; (defun make-frequencies (list-of-things)
;;   (let ((counts '()))
;;     (dolist (thing list-of-things)
;;       (let ((count (alist-get thing counts)))
;;         (if count
;;             (setf (alist-get thing counts) (1+ count))
;;           (setf (alist-get thing counts) 1))))
;;     counts))

(require 'cl-lib)
(require 'seq)

;; This stuff taken from a.el, specialized only for alists.  All of this is
;; necessary because `alist-get' uses `eq', not `equal', so can't be trivially
;; used for strings.

(defun my-alist-get (map key &optional not-found)
  "Like alist-get, but uses equal instead of eq to look up in map MAP key KEY.
Returns NOT-FOUND if the key is not present, or `nil' if
NOT-FOUND is not specified."
  (cl-block nil
    (seq-doseq (pair map)
      (when (equal (car pair) key)
        (cl-return (cdr pair))))
    not-found))

(defun my-has-key (coll k)
  "Check if the given associative collection COLL has a certain key K."
  (not (eq (my-alist-get coll k :not-found) :not-found)))

(defun my-assoc-1 (coll k v)
  "Like `a-assoc', (in COLL assoc K with V) but only takes a single k-v pair.
Internal helper function."
  (if (my-has-key coll k)
        (mapcar (lambda (entry)
                  (if (equal (car entry) k)
                      (cons k v)
                    entry))
                coll)
      (cons (cons k v) coll)))

(defun make-frequencies (list-of-things)
  (let ((counts '()))
    (dolist (thing list-of-things)
      (let ((count (my-alist-get counts thing)))
        (if count
            (setq counts (my-assoc-1 counts thing (1+ count)))
          (setq counts (my-assoc-1 counts thing 1)))))
    counts))

(defun word-count (string-of-words)
  (if string-of-words
      (make-frequencies (s-split-words (downcase string-of-words)))))

(provide 'word-count)
;;; word-count.el ends here
