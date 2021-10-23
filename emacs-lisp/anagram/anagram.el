;;; anagram.el --- Anagram (exercism)

;;; Commentary:

;;; Code:

(require 'seq)
(require 'subr-x)

(defun sort-string (string)
  (string-join (mapcar 'char-to-string (sort (string-to-list string) '<))))

(defun is-anagram (word candidate)
  (let ((down-word (downcase word))
        (down-candidate (downcase candidate)))
    (and
     (not (string= down-word down-candidate))
     (string= (sort-string down-word)
              (sort-string down-candidate)))))

(defun anagrams-for (word candidates)
  (seq-filter (lambda (candidate) (is-anagram word candidate)) candidates))

(provide 'anagram)
;;; anagram.el ends here
