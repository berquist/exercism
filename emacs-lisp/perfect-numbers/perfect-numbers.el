;;; perfect-numbers.el --- perfect-numbers Exercise (exercism)

;;; Commentary:

;;; Code:

(defun get-factors (number)
  "Get all the factors of a NUMBER, not including the number itself."
  (seq-filter (lambda (x) (not (null x)))
              (mapcar
               (lambda (candidate) (if (= (mod number candidate) 0) candidate))
               (number-sequence 1 (/ number 2)))))

(defun sum (nums)
  (apply '+ nums))

(defun classify (number)
  "Do something with NUMBER here."
  (if (> number 0)
      (let* ((factors (get-factors number))
             (aliquot-sum (sum factors)))
        (cond
         ((> aliquot-sum number) 'abundant)
         ((< aliquot-sum number) 'deficient)
         (t 'perfect)))
    (error "Classification is only possible for natural numbers")))

(provide 'perfect-numbers)
;;; perfect-numbers.el ends here
