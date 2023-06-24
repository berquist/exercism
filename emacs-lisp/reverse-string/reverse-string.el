;;; reverse-string.el --- Reverse String (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:


(defun reverse-string (value)
  ;; If you don't want to do (reverse value), which you should, because it's
  ;; pure C...
  (let ((buf '()))
    (dolist (ch (string-to-list value))
      (push ch buf))
    (concat buf)))


(provide 'reverse-string)
;;; reverse-string.el ends here
