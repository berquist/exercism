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
  (take 6 (decode-time (encode-time (+ second 1000000000) minute hour day month year))))

(provide 'gigasecond)
;;; gigasecond.el ends here
