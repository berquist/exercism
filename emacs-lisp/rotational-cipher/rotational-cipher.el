;;; rotational-cipher.el --- Rotational Cipher (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(defmacro rotate-char-branch (bound)
  `(let ((sc (+ c shift-key)))
     (while (> sc ,bound)
       (setq sc (- sc 26)))
     sc))

(defun rotate-char (c shift-key)
  (cond
   ;; A-Z
   ((and (>= c 65) (<= c 90)) (rotate-char-branch 90))
   ;; a-z
   ((and (>= c 97) (<= c 122)) (rotate-char-branch 122))
   (t c)))

(defun rotate (text shift-key)
  (string-join
   (mapcar
    (lambda (s)
      (char-to-string (rotate-char (string-to-char s) shift-key)))
    (split-string text "" t))))


(provide 'rotational-cipher)
;;; rotational-cipher.el ends here
