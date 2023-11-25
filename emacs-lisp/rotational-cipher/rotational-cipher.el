;;; rotational-cipher.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defmacro rotate-char-branch (bound)
  `(let ((sc (+ c shift-key)))
     (while (> sc ,bound)
       (setq sc (- sc 26)))
     sc))

;; A 65
;; Z 90
;; a 97
;; z 122

(defun rotate-char (c shift-key)
  (cond
   ((and (>= c 65) (<= c 90)) (rotate-char-branch 90))
   ((and (>= c 97) (<= c 122)) (rotate-char-branch 122))
   (t c)))

(defun rotate (text shift-key)
  (let ((rotated '()))
    (dolist (s (split-string text "" t))
      (let ((c (string-to-char s)))
        (push (char-to-string (rotate-char c shift-key)) rotated)))
    (string-join (reverse rotated))))


(provide 'rotational-cipher)
;;; rotational-cipher.el ends here
