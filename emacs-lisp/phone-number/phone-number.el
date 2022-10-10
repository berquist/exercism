;;; phone-number.el --- phone-number Exercise (exercism)

;;; Commentary:

(require 'subr-x)

(defun numbers (num)
  (let* ((digit-string (replace-regexp-in-string "[^[:digit:]]" "" num)))
    (if (<= 10 (length digit-string) 11)
        (if (= (length digit-string) 11)
            (let ((cc (substring digit-string 0 1)))
              (if (string= cc "1")
                  (substring digit-string 1 11)
                (make-string 10 48)))
          digit-string)
      (make-string 10 48))))

(defun area-code (num)
  (substring (numbers num) 0 3))

(defun pprint (num)
  (let ((cleaned (numbers num)))
    (concat
     "("
     (substring cleaned 0 3)
     ") "
     (substring cleaned 3 6)
     "-"
     (substring cleaned 6 10))))

(provide 'phone-number)
;;; phone-number.el ends here
