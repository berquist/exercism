;;; armstrong-numbers.el --- armstrong-numbers Exercise (exercism)

;;; Commentary:

(defun an/get-digits (n)
  "Extract the individual digits of number N into a list of numbers."
  (let ((digits '()))
    (while (>= n 10)
      (push (mod n 10) digits)
      (setq n (/ n 10)))
    (push n digits)
    digits))

(defun an/sum (l)
  "Calculate the sum of a list."
  (apply #'+ l))

(defun armstrong-p (n)
  "Is N an Armstrong number?"
  (let* ((digits (an/get-digits n))
         (ndigits (length digits)))
    (eql (an/sum (mapcar #'(lambda (dig) (expt dig ndigits)) digits)) n)))

(provide 'armstrong-numbers)
;;; armstrong-numbers.el ends here
