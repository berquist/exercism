;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(defun take (n seq)
  (let ((ret '()))
    (dolist (i (number-sequence 0 (1- n)))
      (setq ret (cons (nth i seq) ret)))
    (reverse ret)))

(defun from (second minute hour day month year)
  (let* ((encoded-time
          (encode-time (list (+ second 1000000000) minute hour day month year "ignored" nil nil)))
         (decoded-time (decode-time encoded-time)))
    (take 6 decoded-time)))

(provide 'gigasecond)
;;; gigasecond.el ends here
