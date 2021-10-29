;;; pangram.el --- Pangram (exercism)

;;; Commentary:

;;; Code:

(require 'cl-seq)
(require 'seq)

;; (defun seq-all (seq pred))

(defconst lowercase-letters-as-char (string-to-list "abcdefghijklmnopqrstuvwxyz"))

(defun clean-sentence (sentence)
  (cl-remove-duplicates (replace-regexp-in-string "[^[:lower:]]" "" (downcase sentence))))

(defun is-pangram (sentence)
  (let ((cleaned-sentence (clean-sentence sentence)))
    (not (seq-contains-p (mapcar (lambda (letter) (seq-contains-p cleaned-sentence letter)) lowercase-letters-as-char) nil))))


(provide 'pangram)
;;; pangram.el ends here
